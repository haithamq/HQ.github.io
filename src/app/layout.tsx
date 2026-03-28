import type { Metadata } from "next";
import { Inter } from "next/font/google";
import "./globals.css";

const inter = Inter({
  subsets: ["latin"],
  variable: "--font-inter",
  display: "swap",
});

export const metadata: Metadata = {
  title: {
    default: "HQ IT Solutions",
    template: "%s | HQ IT Solutions",
  },
  description:
    "Business IT solutions, software, and digital services for modern enterprises.",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en" className={`light ${inter.variable}`}>
      <body className={`min-h-screen font-sans antialiased ${inter.className}`}>
        {children}
      </body>
    </html>
  );
}
