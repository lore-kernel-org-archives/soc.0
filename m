Return-Path: <SRS0=alP7=LK=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE771C48BE5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jun 2021 06:26:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90BFB613C2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jun 2021 06:26:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90BFB613C2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Cc:To:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Kxna99Qp9jN4MeO7AW27j2aAsjr+CNCs042rWYJ443Q=; b=zEA9hPtJQwIGdG
	pK/71nebT/j5f8+ra+3ZK2QwUr/I9RjGD6CbDUg/6peShsCo307uu7S754zxZ8BBB9GZj7vaEGC2U
	0ZWxWUtCde3iSQBCpl5QMJcTRTTFtKfhzocvZsRB/5yev0/VJzESfhrT92HvEjaCps8IfphNQ6NQW
	/pMqBXGlFC0G4FdEYKHs88BnspVuHtjLjRh6/3a1TSkIwpfRcyF1gVsUVaKofv9jPoKM4ys7dX+0Q
	rNnFReO8EkC2honwzSmCELhvADLDixZyIDOt6HHXfLcsql7BdStsV7GRBngG7gRDw1jWgGI1/nImZ
	JgjF3wcdCr/6T3isZ6qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltOzJ-0051ip-3T; Wed, 16 Jun 2021 06:25:21 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltOzD-0051h9-Lr
 for linux-arm-kernel@lists.infradead.org; Wed, 16 Jun 2021 06:25:18 +0000
Received: by mail-wr1-x436.google.com with SMTP id a11so1212448wrt.13
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 15 Jun 2021 23:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:subject:to:cc:organization:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=AUZLUp42K/lZfioAjz/zadZDn+47Sd2vr6fMgCganLM=;
 b=da715xJIs1OGYk8W+yihj2EYBsJ+t22FZAlss9QxIeGY4dTGUfg04SV4ZLMLcU1b6S
 PF2xF1roY98hEm9Zwo4rT/lNDE5YbC/c29lvkp7Lfd1cGpS/X6MDiwhxaxRK7LNuopko
 MDGzNaBsIFQuiY4latdCXTA4dtfo90GZgxyo6yam57zsUN4X5Ca6Z4CJOi0iYfQjdSLP
 8+UiulZHKsp+6U4GA96EszJNglsfvoEZetHzux7msKlVOyJMHSf+7nOYrZLWklkEPNUH
 TTYG0xYKs0qfXh+DHznLKtlfiTXXDODCQZxbi+nVUDeYg3TW1nWwpOyOsg6vsua6Mz7/
 VjHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:organization:message-id:date
 :user-agent:mime-version:content-language:content-transfer-encoding;
 bh=AUZLUp42K/lZfioAjz/zadZDn+47Sd2vr6fMgCganLM=;
 b=gV2MHkPPmCXlh7Q1F4Yh2sFiT3Tzc+EtXxofZDyWC6bx8BGdqOvfCwaQc48RpVzUku
 cTzUGTWcnB5euNMhMgxR3Sle+EHv+TdoYdJlUjLsobcV5Ybu5HAy0MYnXZMTOQmeQLd0
 Mg684CodbIpy6acbF4saYy2usIVRaSrhxuAkHBwztHeJiCVkCwlt9Kj8GKR6FWrc/Ldi
 VAfbETrT7TQ2RxkKu9PNtsiYtgNDTV36PiWau5Xx/qYgY9YeZV93c0tZevfmR84QtkoU
 dXCca502m+B8Nljt3Dp7Jd6NWFAvDxrDSUEU4bk/+gF6IDHgaOI2i3Ikda93lOHorRyX
 XGUA==
X-Gm-Message-State: AOAM531U7aFChACw+0Iq0xA/B5zxNimJI7MrO8isIzNK9Bulht3GPNv4
 Jf1GTkuLllyQxddEnk71MBf0tkM9Rsivr9pq
X-Google-Smtp-Source: ABdhPJww34TnZw+Mcbi7UsDVAQwY7mMh972gsuBgbSstjk5G0zLB8T69bGa+0DYd3TU5rgPNnH0oEw==
X-Received: by 2002:adf:ee82:: with SMTP id b2mr3305744wro.360.1623824713130; 
 Tue, 15 Jun 2021 23:25:13 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:6b98:6d35:fe47:b739?
 ([2a01:e0a:90c:e290:6b98:6d35:fe47:b739])
 by smtp.gmail.com with ESMTPSA id c20sm726379wml.37.2021.06.15.23.25.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jun 2021 23:25:12 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [GIT PULL] arm64: dts: amlogic updates for v5.14, part 2
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Organization: Baylibre
Message-ID: <c953e97a-f901-a749-1fb6-b1caa75b4748@baylibre.com>
Date: Wed, 16 Jun 2021 08:25:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_232515_830459_16D8BF25 
X-CRM114-Status: GOOD (  11.55  )
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
Message-ID: <20210616062511.nHQa5tlspCXtTpFjbkiBLBcAlFXoI-ja6ASekNwl16U@z>

Hi,

Here's some changes to enhance support for the Odroid C4 & Odroid HC4 boards.

Neil

The following changes since commit a270a2b24de5be0480136cbbd7805b9134762b97:

  arm64: dts: meson: set 128bytes FIFO size on uart A (2021-06-01 10:27:02 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm64-dt-for-v5.14-v2

for you to fetch changes up to 303d2af21aedeaebe824411fbff912dfcdb48de5:

  arm64: dts: meson-sm1-odroid-c4: remove invalid hub_5v regulator (2021-06-14 09:57:45 +0200)

----------------------------------------------------------------
Amlogic ARM64 DT changes for v5.14 round 2:
-  various fixes for Odroid C4/HC4 regulators handling, USB and SPI NOR Flash for HC4

----------------------------------------------------------------
Christian Hewitt (1):
      arm64: dts: meson-sm1-odroid-hc4: add spifc node to ODROID-HC4

Neil Armstrong (6):
      arm64: dts: meson-sm1-odroid: add missing enable gpio and supply for tf_io regulator
      arm64: dts: meson-sm1-odroid: set tf_io regulator gpio as open source
      arm64: dts: meson-sm1-odroid: add 5v regulator gpio
      arm64: dts: meson-sm1-odroid-hc4: disable unused USB PHY0
      arm64: dts: meson-sm1-odroid-hc4: add regulators controlled by GPIOH_8
      arm64: dts: meson-sm1-odroid-c4: remove invalid hub_5v regulator

 .../arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts | 17 --------
 .../boot/dts/amlogic/meson-sm1-odroid-hc4.dts      | 48 +++++++++++++++++++++-
 arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi  |  9 +++-
 3 files changed, 54 insertions(+), 20 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
