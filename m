Return-Path: <SRS0=XAKR=K4=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E102C47083
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jun 2021 09:04:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BC72613AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jun 2021 09:04:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4BC72613AA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Cc:To:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RksFrLNXk2mLdJkwQJ5Y+HAw49+AeikJOj3iWPz89R8=; b=RcwCKACmGteylV
	b7tgOQLTIC3OotCXTGMhqIfzjR3w4g/qSljpcxQpyp14+AU81+Q0niJlGkQTbmXWZV8udn7KMLm2k
	LSmo0YQfAIsYUvpJgAUAQCGWJ60p79q8do7tA75j47BoaOIeQwYHG9+tMqvGAOiEZhns4FZnpikF+
	5BmnGoicL34sdfAG5YNP+pMuSQP1epWsvyL1ySRhNsb/BPgFEguS413GQgmoriryjcWQc++Y929SX
	P8dcYCYloRe69R1dsrhqSa/I8Iymv40b3w9ae7pSdshCxVPVg8LV9hQMZXrKJ1N2cgnWPFoGW/3D3
	b6ocTvAS+ZGYbQDxLNxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loMll-002qaa-V3; Wed, 02 Jun 2021 09:02:35 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loMWn-002lOq-5n
 for linux-arm-kernel@lists.infradead.org; Wed, 02 Jun 2021 08:47:07 +0000
Received: by mail-wr1-x42f.google.com with SMTP id h8so1413411wrz.8
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 02 Jun 2021 01:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:subject:to:cc:organization:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=ch8odCii0jbUEayBNz5PH1VkcSulmShj14mgcVkeUbI=;
 b=fYAZRTperpNR8a/ILq4ijvaLZlihQDfXCbdbqeOh7VNtYzL++sYPL0jw4+W7uryFMF
 2nTgsjFdFPb8zObAEF6Awj03dCNWBV2xLh8wFYbJNeEeCtq0gLTHUvEvpGTJobj1YJtK
 MXkrkSqbDysOq67K/v0EHw/mDAYgAL5IrZkHTLl65v918f5v99gJatPfOTvY17ru2Yo1
 OuVEVfqusrqLwC2j+9nBeA/V/iEPCmKgodhBNLg/roEH7vuv4a+C4mbDeY5Vdtc+8x1e
 kuj/5BSCWl8Nmp9hYzIM4KQ49vbIfKI+DCgfUpxFPQcLz6lVYtoE15vCmLARIIqq6G3S
 u7aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:organization:message-id:date
 :user-agent:mime-version:content-language:content-transfer-encoding;
 bh=ch8odCii0jbUEayBNz5PH1VkcSulmShj14mgcVkeUbI=;
 b=kc+VNRzygTg17gzwOQk059pX0BQ9DMCtQSV0Br1DefXdnrcMKdf/IHd9mkmYcYfVN6
 oU07N+xdftPaZExwc8KwTLQO7SmCs2g0aIh0m40Gehwdvwl3UQbkIPtXZu7YKOASO067
 w+Ij6EjOOQ9xAEYHLnmc0OCk8k1Uvlc0Ri2GP/p/IucN69Jv9hnwP1ICaYWfGCEgO9R/
 Z2a/wUcxRpaxaCUTGb21/m/2e4mJUMdm0MiTSPgBDqGMrL72yL7cZEVcYLdAj2/pdzfo
 Z99+vG30sexVnd0Z7fqIOgxyNCzGyN+ntkf4g2rVt7I0KuN9MfdzXQom0ahI0rLyrkqE
 afIw==
X-Gm-Message-State: AOAM530tzysbpekmbs69UC3N9YebmVE2+ALevyVPy7X8IkBYLbGE2msA
 5SuJZb6G5sZAe/4DEJ+Oqpu2tw==
X-Google-Smtp-Source: ABdhPJxlo3D+p1t58u6+T9S+bruGgJ4TX6cNGRNmCmCd5BuIsfIVgUGCOd8KQpR9NW4IpxI1jHP7jQ==
X-Received: by 2002:adf:ce90:: with SMTP id r16mr25919709wrn.146.1622623623254; 
 Wed, 02 Jun 2021 01:47:03 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:5bc3:680:d34c:955b?
 ([2a01:e0a:90c:e290:5bc3:680:d34c:955b])
 by smtp.gmail.com with ESMTPSA id 89sm6831225wrq.14.2021.06.02.01.47.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 01:47:02 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [GIT PULL] arm64: dts: amlogic updates for v5.14
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Organization: Baylibre
Message-ID: <bb207cf8-fc7a-3121-eea8-56618b5952aa@baylibre.com>
Date: Wed, 2 Jun 2021 10:47:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210602_014705_276578_D4D96035 
X-CRM114-Status: GOOD (  13.61  )
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
Message-ID: <20210602084701.iDS3RSE_XBMdpf3C43lOr4Ovk564g7nKbsDsEaq4VTQ@z>

Hi,

Here's the ARM64 DT changes for v5.14:
- new Banana PI BPI-M5 board
- handle of UART A bigger FIFO
- various audio changes for internal DAC and loopback

Neil

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm64-dt-for-v5.14

for you to fetch changes up to a270a2b24de5be0480136cbbd7805b9134762b97:

  arm64: dts: meson: set 128bytes FIFO size on uart A (2021-06-01 10:27:02 +0200)

----------------------------------------------------------------
Amlogic ARM64 DT changed for v5.14:
- set 128bytes FIFO size on uart A
- add Banana PI BPI-M5 board dts & bindings
- meson-sm1: add toacodec node to use internal audio DAC
- enable hdmi audio loopback on VIM3 board

----------------------------------------------------------------
Jerome Brunet (1):
      arm64: dts: meson: vim3: enable hdmi audio loopback

Neil Armstrong (4):
      arm64: dts: meson-sm1: add toacodec node
      dt-bindings: arm: amlogic: add Banana PI M5 bindings
      arm64: dts: meson-sm1: add Banana PI BPI-M5 board dts
      arm64: dts: meson: set 128bytes FIFO size on uart A

 Documentation/devicetree/bindings/arm/amlogic.yaml |   1 +
 arch/arm64/boot/dts/amlogic/Makefile               |   1 +
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi         |   1 +
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi  |   1 +
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi          |   1 +
 arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi |  41 +-
 .../boot/dts/amlogic/meson-sm1-bananapi-m5.dts     | 646 +++++++++++++++++++++
 .../boot/dts/amlogic/meson-sm1-khadas-vim3l.dts    |  13 +
 arch/arm64/boot/dts/amlogic/meson-sm1.dtsi         |  10 +
 9 files changed, 711 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
