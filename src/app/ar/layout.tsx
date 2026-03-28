import { Noto_Sans_Arabic } from "next/font/google";

const notoArabic = Noto_Sans_Arabic({
  subsets: ["arabic"],
  display: "swap",
});

export default function ArabicLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <div dir="rtl" lang="ar" className={notoArabic.className}>
      {children}
    </div>
  );
}
