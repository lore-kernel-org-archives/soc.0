Return-Path: <SRS0=hzE+=KD=monstr.eu=monstr@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FF5DC54E49
	for <soc@archiver.kernel.org>; Mon, 26 Feb 2024 12:12:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3CBFDC43390; Mon, 26 Feb 2024 12:12:34 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 28685C433F1
	for <soc@kernel.org>; Mon, 26 Feb 2024 12:12:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 28685C433F1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=monstr.eu
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-60908e5fb9eso5727557b3.2
        for <soc@kernel.org>; Mon, 26 Feb 2024 04:12:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20230601.gappssmtp.com; s=20230601; t=1708949550; x=1709554350; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+3NlhK2NplClKgCuNW6sST7a+GqRQRhrHRBsNzh7BvI=;
        b=zR+AfkLw0UGUOv2/OOeT0FVA6RNdzYx6wd+6gr+6BR+woKrHcS6LWDSoYyQjP+jO8e
         zGlr5p/45M4W4ZWiEWq4kExttYEcoT+yEcPEN/EedkK02bfN9e7dU5chY9m2ZfFDJneC
         u4NnbBNeBEHVUee5xPU65efC9KqH2pvadRAAarYSfVI36gizjmb4ohLWD8hJ5MHLSz+/
         YRFkXRcxQheNOoihRhvvND2tnUBOYEbsbaoQMgRq+mP5/HZ9c/XEXK6zLyMvIIArwLFI
         9VqFkL89JJ4wI/Dd01q5n4dhfxvbyXAyovVqsV27xg8g7nEMed8TuNt7KPScXEC2NdNY
         3KQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708949550; x=1709554350;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+3NlhK2NplClKgCuNW6sST7a+GqRQRhrHRBsNzh7BvI=;
        b=RC+NxA5dT+0RHNn42bDgbrQ14JRRuu3T/j8ThDjhypYDSbXiQwFQZW1+PGZNhwMlcr
         8bvjlRe+xIEI9LrDhGffYjGNTv4niCMgp16eG1FQrO/9RgKUhjy/xAQnAT8BZWfgux45
         gHukvrtO5JYT97Ud7ssK2UaFWqQHuptcGPI06xKd4L5m1o8OGi2xX6BqkDMVWIIsHbEL
         y6k+pTKATMzHz4TIwUhlFmPuIrDP8fbAjwUpoJ01snfxtfav9M/FGoPV0oYrN0cQNqf0
         X3Vps753zVj87vfih6vcZZsx7SQgFOSDJDdzJxt2CZRw0kRxH41TS0hpoF+GRPUQ4W8v
         02gA==
X-Gm-Message-State: AOJu0Yzo3V4AcA95OqHI1rgUsKdlbTmMAjXrek734FOa0NxPL+zusfP9
	6JRoCbxQUZxb9WoLYRzWof1KRn8tm7jAdEB/Z33hUcSXNrKCO9vcw1zYvhU5ljChv5mPgTXiAA5
	pv+Dv7gVUZlcTiVTxKJv8ognbxUgF+eo31IGQ1LExVAeZFov34+T1
X-Google-Smtp-Source: AGHT+IHd7y9yQC8+HWBy7AKLDQgGlw2JZz5cU1BO5bZJg2RC7+XRWOw/qQTVJ8AieaDtqILJYCkXcLytxA2pDKWGUq8=
X-Received: by 2002:a25:818c:0:b0:dc5:f51e:6a60 with SMTP id
 p12-20020a25818c000000b00dc5f51e6a60mr4177757ybk.6.1708949550041; Mon, 26 Feb
 2024 04:12:30 -0800 (PST)
MIME-Version: 1.0
From: Michal Simek <monstr@monstr.eu>
Date: Mon, 26 Feb 2024 13:12:18 +0100
Message-ID: <CAHTX3dJpawPhgVxSsXuSvG20JY9r4EkJu2NrrH1OKRjKxTpNAA@mail.gmail.com>
Subject: [GIT PULL] ARM: Zynq SoC changes for v6.9
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: linux-arm <linux-arm-kernel@lists.infradead.org>
Content-Type: multipart/alternative; boundary="000000000000dea464061247d29a"

--000000000000dea464061247d29a
Content-Type: text/plain; charset="UTF-8"

Hi,

please pull these two simple patches to your tree.

Thanks,
Michal

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  https://github.com/Xilinx/linux-xlnx.git tags/zynq-soc-for-6.9

for you to fetch changes up to a22f00c0167f459a19a4828d3c24943ae4694418:

  ARM: zynq: Remove clk/zynq.h header (2024-01-22 14:22:10 +0100)

----------------------------------------------------------------
ARM: Zynq SoC changes for 6.9

- Fix kernel-doc
- Removed one useless header

----------------------------------------------------------------
Michal Simek (1):
      ARM: zynq: Remove clk/zynq.h header

Randy Dunlap (1):
      ARM: zynq: slcr: fix function prototype kernel-doc warnings

 arch/arm/mach-zynq/slcr.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs

--000000000000dea464061247d29a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div><div>please pull these two si=
mple patches to your tree.</div><div><br></div><div>Thanks,</div><div>Micha=
l<br></div><div><br></div>The following changes since commit 6613476e225e09=
0cc9aad49be7fa504e290dd33d:<br><br>=C2=A0 Linux 6.8-rc1 (2024-01-21 14:11:3=
2 -0800)<br><br>are available in the Git repository at:<br><br>=C2=A0 <a hr=
ef=3D"https://github.com/Xilinx/linux-xlnx.git">https://github.com/Xilinx/l=
inux-xlnx.git</a> tags/zynq-soc-for-6.9<br><br>for you to fetch changes up =
to a22f00c0167f459a19a4828d3c24943ae4694418:<br><br>=C2=A0 ARM: zynq: Remov=
e clk/zynq.h header (2024-01-22 14:22:10 +0100)<br><br>--------------------=
--------------------------------------------<br>ARM: Zynq SoC changes for 6=
.9<br><br>- Fix kernel-doc<br>- Removed one useless header<br><br>---------=
-------------------------------------------------------<br>Michal Simek (1)=
:<br>=C2=A0 =C2=A0 =C2=A0 ARM: zynq: Remove clk/zynq.h header<br><br>Randy =
Dunlap (1):<br>=C2=A0 =C2=A0 =C2=A0 ARM: zynq: slcr: fix function prototype=
 kernel-doc warnings<br><br>=C2=A0arch/arm/mach-zynq/slcr.c | 5 ++---<br>=
=C2=A01 file changed, 2 insertions(+), 3 deletions(-)<br><br><span class=3D=
"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_sign=
ature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div>Michal Sime=
k, Ing. (M.Eng), OpenPGP -&gt; KeyID: FE3D1F91<br>w: <a href=3D"http://www.=
monstr.eu" target=3D"_blank">www.monstr.eu</a> p: +42-0-721842854<br>Mainta=
iner of Linux kernel - Xilinx Microblaze<br>Maintainer of Linux kernel - Xi=
linx Zynq ARM and ZynqMP ARM64 SoCs<br>U-Boot custodian - Xilinx Microblaze=
/Zynq/ZynqMP/Versal SoCs</div></div></div></div>

--000000000000dea464061247d29a--
