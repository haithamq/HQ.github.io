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
    default: "ArchitectCore IT Solutions",
    template: "%s | ArchitectCore",
  },
  description:
    "Precision-grade software infrastructures and IT solutions for modern enterprises.",
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
