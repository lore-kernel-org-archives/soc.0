Return-Path: <SRS0=fGbl=O4=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56F79C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Oct 2021 20:14:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 235E060F93
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Oct 2021 20:14:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 235E060F93
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Rs3Qx0MXCF8nubbkzkX9nHS3dY+QSn9/VYo7/zeiS8=; b=PsHB2XaPNneasl
	hDMSM1CtfNYX1B2a+X2J6FoZgwX1u5kYByTGYgQ16CrmUHaI1vNI+9imP412LEKmQuk/2G8DA62nk
	Oh+L3y3S/igWUfQtkD4tbUmvJGOolIG+uFBV46gnpVHc8YNnnateWZsoNAzW/bxHp5o+8xYhA+yNf
	zh7sBnxH4hAqrbNVLOaqx1W1b54sXxDLdULlzK8SpCYnsQDdRKuJ26p9KwGHyPc+xuYYGmD6QPiOp
	iSd8lvIcxkoBp4oNTneclpqvELNg188ubDm/f29/s542AjrNqji02aPPpRwGo0IeP5RtKsbSg7KyV
	vyG8Ysxs+zOAUMyBIlhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYwEh-00433W-H4; Fri, 08 Oct 2021 20:12:55 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYwDa-0042jM-G4
 for linux-arm-kernel@lists.infradead.org; Fri, 08 Oct 2021 20:11:47 +0000
Received: by mail-wr1-x435.google.com with SMTP id k7so32923265wrd.13
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 08 Oct 2021 13:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CJBkgInhT6PLCmAU8FT+r7FUkf+LpzjWJN55V3vRhsM=;
 b=jNAIOVRVou5pRLaLljnHnuuDcM+O8yh7ViN38/lGI4LU8NdL4usiHkE/sSjz1iahDL
 dZhz8MHiLg0dk33XZ0lh9z2FmjgAW7NUMSH4Dvgoarka10VUwCOBakAzmod++EacZuqi
 L6M6DImyN4aMlzbNN10s/PM5ZEjN96TqqJ0P0IyJA8UKBi6u/3iZ2kcjcmfSirYlDfig
 gacwMgq3XurCP7LxsfBOobR0sksyMpjT0FB6SD9HxtzLGf96VkGn21/qDnbrpkjL7JGA
 BB98ZPBSPlNTboITjzsiamrIGKkWLYwpd9dlyLWnbsydlPYed0TUS/v7QV1vWNbYZQSO
 twQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CJBkgInhT6PLCmAU8FT+r7FUkf+LpzjWJN55V3vRhsM=;
 b=EaKsy05LXoXaIsGfbd78ysa0nHCSdFT9oANX/rfND2JEiwjO2sP9wzmbbRK2N4NYpA
 e0aD5yA7krWcHmohayNYSW8SN+eeEiQ1nrGfC+iPuUWQ9Famen2KbKQzp80e+uomznj4
 amVOQqs7h4/8FgHgiDjr34uYkrWsWPHkW67cnDZ1nJExzvgMBq7R260SB0o9I1i/ApfM
 +HBK5d0E2y9Jldp55z1/snNxTN5J4Jyf4z7EX6GP8FieMqbbVvX//3X8aPQ7K9M44yXV
 S++AKOzvXKmn8J6zNgNWsy7+jQvZ2HD+Vk+lZg2CbFx/7YNiuyaBWaO4Pd7zTN/HgvTW
 jESg==
X-Gm-Message-State: AOAM531HuXDOwrMiVpSrJWcvYgQqQ5zDyq175iahTvz9pUE65FV7ps4q
 h4/hLw5XkruSL9Wp6eagu5Bl7/4hZzs=
X-Google-Smtp-Source: ABdhPJyCi6SYxdSoPHScuvGYOUYb3kBIEa8OHcQM2/3o2YR/dtdUGf7iinL4/1CLgqhr0PiwSX6cCA==
X-Received: by 2002:a7b:c8d1:: with SMTP id f17mr5776836wml.35.1633723905379; 
 Fri, 08 Oct 2021 13:11:45 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id s14sm281313wro.76.2021.10.08.13.11.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 13:11:44 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 6/7] arm64: tegra: Device tree changes for v5.16-rc1
Date: Fri,  8 Oct 2021 22:11:31 +0200
Message-ID: <20211008201132.1678814-7-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211008201132.1678814-1-thierry.reding@gmail.com>
References: <20211008201132.1678814-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_131146_582834_B17CDA9F 
X-CRM114-Status: GOOD (  10.98  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20211008201131.k0YRl92ZqI9cFqY9uC7mA0Svy_SkBwOZagoCiuS9IWo@z>

Hi ARM SoC maintainers,

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.16-arm64-dt

for you to fetch changes up to b9e2404c8bb280e0b7cbf1c2e9b491baab107137:

  arm64: tegra: Fix pcie-ep DT nodes (2021-10-07 21:23:37 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree changes for v5.16-rc1

This enables additional interrupts on the Tegra194 GPIO controller for
better load balancing and/or virtualization, adds audio support on
Jetson TX2 NX, enables the NVDEC video decoder on Tegra186 and later and
enables more audio processors that are found on Tegra210 and later.

Various cleanups across the board top things off.

----------------------------------------------------------------
David Heidelberg (1):
      arm64: tegra: Remove unused backlight-boot-off property

Dmitry Osipenko (1):
      arm64: tegra: Add new USB PHY properties on Tegra132

Mauro Carvalho Chehab (1):
      arm64: tegra: Fix pcie-ep DT nodes

Mikko Perttunen (1):
      arm64: tegra: Add NVDEC to Tegra186/194 device trees

Sameer Pujar (4):
      arm64: tegra: Audio graph sound card for Jetson TX2 NX
      arm64: tegra: Update HDA card name on Jetson TX2 NX
      arm64: tegra: Add few AHUB devices for Tegra210 and later
      arm64: tegra: Extend APE audio support on Jetson platforms

Thierry Reding (1):
      arm64: tegra: Remove useless usb-ehci compatible string

pshete (1):
      arm64: tegra: Add additional GPIO interrupt entries on Tegra194

 arch/arm64/boot/dts/nvidia/tegra132-norrin.dts     |    2 -
 arch/arm64/boot/dts/nvidia/tegra132.dtsi           |   12 +-
 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts | 1244 +++++++++++++++++++
 .../dts/nvidia/tegra186-p3509-0000+p3636-0001.dts  |  506 +++++++-
 arch/arm64/boot/dts/nvidia/tegra186.dtsi           |  136 +++
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts | 1243 ++++++++++++++++++-
 .../arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi | 1246 +++++++++++++++++++-
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           |  209 +++-
 arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts |  876 ++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts |  876 ++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           |   81 +-
 11 files changed, 6416 insertions(+), 15 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
