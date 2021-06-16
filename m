Return-Path: <SRS0=GiEQ=LK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13632C48BE5
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Jun 2021 06:25:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8762C61369
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Jun 2021 06:25:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8762C61369
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Cc:To:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=E3KyozfJ8RB+85wsSoR3rW3A5lveNNT6wJBqWPs7dzU=; b=3OcqEZ/eo1Fwjc
	Lme8jo+VpaYyKqSIIGOMs5LqVJiuhHh30nNTnLv1mQCWrq/2amohLYQor4zD3RPZyu5ysL2T0Gn3G
	i8zJ8uNm453XZU1pRiCYEZY7hFCVgbuSkh6Kp5VuvgTFggH4lp7og5FwK0tmfRUWL4L/1w8B1umfx
	rmA/3MXUCnty+wIP9G9iO+jzWcMhnzGltxLE6bi3cE04CZPbWJXCogTADUbMmhATKnVtDzx8+mJbq
	2VthD3UiWyq1oyr4aky0TC9we27uQdbSE9mIcm+fBTEatUOSOKHXUQLdp8lxNWTDmT4b5gFX5DzZa
	2R5FCzuofQ/K/8CcElJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltOzH-0051ia-7u; Wed, 16 Jun 2021 06:25:19 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltOzD-0051hA-MZ
 for linux-amlogic@lists.infradead.org; Wed, 16 Jun 2021 06:25:18 +0000
Received: by mail-wr1-x436.google.com with SMTP id m18so1260958wrv.2
 for <linux-amlogic@lists.infradead.org>; Tue, 15 Jun 2021 23:25:14 -0700 (PDT)
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
 b=d7xnPE3d9P0QONffDfrCNp0pG/PYNU9MCYSiVlrRJvVTpaZsKdhflxYnpHnu5ndrxm
 r4WsCHGGAFtDwb7q2OHoG3yZdB6RLsLTZB4FWkjnW2LSoGlnBRp2yGf7qzjjjw8gwy3M
 nwrToCJVctVr5r+s1YbTA0De+fUWWIj2935ZSqkhgudkFn6vq0rGEi2PcVuVlZ7wLy0M
 4Xt7ArTRbocBSRcMR4JiGUMRbZO8QkTugCrNU+I9aFW9oXROcCQHUhL43xpbH4UWJnXv
 LI406OmeXauto5fpkRfEfJK0vGIOqkgKoHaduPYnX8qKnKSPnKT9esJlWII0AMRE66iu
 bxTQ==
X-Gm-Message-State: AOAM530AUjFp6QP8RZuc7gZmGwpmSPa1dv8TdWPWohQ1eD6qD0dRwbFv
 DReWXKwBlZxzWaY4ELO9oinGNpEmWUugMNEE
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
X-CRM114-CacheID: sfid-20210615_232515_828469_A92EADAF 
X-CRM114-Status: GOOD (  10.13  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
Message-ID: <20210616062511.mjXYV22oMD-Rk5oKX7g80UGHvhZEH7Ugbsrvms2qF9I@z>

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
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
