import type { Metadata } from "next";
import { Inter } from "next/font/google";
import "./globals.css";

const inter = Inter({
  subsets: ["latin"],
  variable: "--font-inter",
  weight: ["300", "400", "500", "600", "700", "800", "900"],
  display: "swap",
});

export const metadata: Metadata = {
  title: "Portfolio | ArchitectCore IT Solutions",
  description:
    "Case studies and engineered digital infrastructure from ArchitectCore IT.",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en" className={`${inter.variable} light h-full antialiased`}>
      <body className="min-h-full bg-surface font-sans text-on-surface">
        {children}
      </body>
    </html>
  );
}
