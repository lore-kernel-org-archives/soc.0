Return-Path: <SRS0=P7uH=H3=monstr.eu=monstr@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 908C4C46CA2
	for <soc@archiver.kernel.org>; Sat, 16 Dec 2023 14:10:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 42DCBC433C7; Sat, 16 Dec 2023 14:10:46 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 81A13C433C8
	for <soc@kernel.org>; Sat, 16 Dec 2023 14:10:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 81A13C433C8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=monstr.eu
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-5de93b677f4so13054447b3.2
        for <soc@kernel.org>; Sat, 16 Dec 2023 06:10:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20230601.gappssmtp.com; s=20230601; t=1702735842; x=1703340642; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fM3duOUg1Ydjz1h0+CCS65tbpEfKZvxljaGmYxZKMYM=;
        b=SCgyK/15gjhS+U6pYmn2Sc31kdrtvAMtSctjtQs6aN/3MT7IIwftrBgfbhnnEIQUYe
         jtiT5fL5vew3qjwfb7gLe9pd4mQbtY9ZORVuPvgwhQe//EXw8vLdYl04UXRQkZYslOPE
         FWrH40uTY9zAWaHdvKkVzKP//LKvHTs9KJm9zCq71umK0kPQ0QU5ZqUllXtHXir438SY
         m6FL5sB7ZyuM0iaE8kAS/6bLfq2Mzjiku+ax35V/2N49ehoZ70zjaNRwvZzJQtubXSU/
         op5V9vAbKZfuZOFQx+thDDYmwsaZ8kyTje2FJzDjsMy+75e1hwe2jntyERCZ421czKAG
         iWBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702735842; x=1703340642;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fM3duOUg1Ydjz1h0+CCS65tbpEfKZvxljaGmYxZKMYM=;
        b=fL1iqCBrsHRFvXZXu7Gc3iuecvP/akp9Se2JiWdMENpl1H/VOkpfVkU43G3tA4uQju
         n6VbPC/Td6CTqEO/MGPm5SmntOmWX3ec/Wy7kSqTXu6eiHFBl37LpNXYrSYw2+A7IX1/
         o3W25aijuYrHuvEmLMm/zHtOAZGVksk4C+8erXLD+m08WNoubfyp3PHEN1+dsKtKE42F
         mYQRiveYiLNnsTRcU7ozgzk67uYk5zUo6xip20CnzglzrX5wqzMpqM5Is478z4PhfyNH
         ac1vUXy9vI5+W+5wwOWy09gh7dH+px1q41iFqYp7Du8cy+CBpApSJe+bfKL76Z2fbzHJ
         w0zg==
X-Gm-Message-State: AOJu0Ywgw6DMAbfSbw1eoHhbSf7JkPnk1VB6qfSOHAGDJhLP6YLvHmIO
	j1KXPdrXTQo6B3HjYN+gBsQG3z97TKnEBqqRsdv0NeI9TkFtFe0JLTXrvg==
X-Google-Smtp-Source: AGHT+IFNWHcMMNCNuL8dz1iNHHDN54h5YRGZX/xqOPh2QRFyf+idEfnwZcsBcmlonSXkcpHyfYQhwwS0pcYFbV2I4N4=
X-Received: by 2002:a05:6902:cc2:b0:db7:dacf:3fb0 with SMTP id
 cq2-20020a0569020cc200b00db7dacf3fb0mr8316104ybb.93.1702735842653; Sat, 16
 Dec 2023 06:10:42 -0800 (PST)
MIME-Version: 1.0
From: Michal Simek <monstr@monstr.eu>
Date: Sat, 16 Dec 2023 15:10:31 +0100
Message-ID: <CAHTX3dJp_dztRCOn+-_OCeb-L6He7Pi2t-K0QeTDACaMs-xfTA@mail.gmail.com>
Subject: [GIT PULL RESEND] arm64: soc: ZynqMP SoC changes for v6.8
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, Arnd Bergmann <arnd@kernel.org>
Cc: linux-arm <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

please pull these patches to your tree. I am sending it again because
I see origin email in lore here
https://lore.kernel.org/soc/a41bcab2-1d28-42fd-b5ff-1d6fb5226cf1@monstr.eu/=
T/#u
but I can't see it in patchwork.

Thanks,
Michal


 The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa8=
6:

   Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

 are available in the Git repository at:

   https://github.com/Xilinx/linux-xlnx.git tags/zynqmp-soc-for-6.8

 for you to fetch changes up to 87fda1acfc3b9048261799817ef749e6deb95724:

   soc: xilinx: Add error message for invalid payload received from
IPI callback. (2023-12-13 16:55:15 +0100)

 ----------------------------------------------------------------
 arm64: ZynqMP SoC changes for 6.8

 power driver:
 - Move to remove_new hook
 - Report error around unsupported callback
 - Fix long messages

 event driver:
 - Fix cpu_id handling
 - Fix warning message

 ----------------------------------------------------------------
 HariBabu Gattem (1):
       soc: xilinx: Fix for call trace due to the usage of smp_processor_id=
()

 Michal Simek (1):
       soc: xilinx: fix quoted string split across lines

 Naman Trivedi Manojbhai (1):
       soc: xilinx: Add error message for invalid payload received
from IPI callback.

 Tanmay Shah (1):
       soc: xilinx: fix unhandled SGI warning message

 Uwe Kleine-K=C3=B6nig (1):
       soc/xilinx: zynqmp_power: Convert to platform remove callback
returning void

  drivers/soc/xilinx/xlnx_event_manager.c |  7 +++++--
  drivers/soc/xilinx/zynqmp_power.c       | 16 ++++++++--------
  2 files changed, 13 insertions(+), 10 deletions(-)

--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs
