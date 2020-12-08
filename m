Return-Path: <SRS0=YCAW=FM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF51AC433FE
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Dec 2020 19:25:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EFB623B8A
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Dec 2020 19:25:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3EFB623B8A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wxZAE+UIHYDNSZ8T9F21GyaMGcmyl3TisxgVVa3GMfE=; b=djLeprKl4z2/Xb2AeXQfav6lwx
	+ui2nENWDn8nygqkTP/mxFGs0qDwX0HOAlEpOdkMDr8dc7mrwAPOxUMQJho9n3+zEsTonFJNaonwY
	rT8NaYqzN/L6A18sjgMM6r0CVQsuH3RlxW6e557ovpppady/PIH9HhfsJQvCYmIfYpjthEEvbQ4zH
	Y5mHS1/+3j4FV5+c5D3XFLqYv6zHkgQwFn/fQb4D9xuqvcbhr3FzF4X5D5Nl+zcMDSrti/ZiqwZXF
	93FyGYXfOxotmoK81uHVG9FL/XSuzGODYmfE83R7asBtSDT0bCjLWNEEOYzLZ7HCiOqrDBcmAHrn0
	Ll3DmltQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmibZ-0006Xh-Vj; Tue, 08 Dec 2020 19:24:58 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmibW-0006X2-IO
 for linux-amlogic@lists.infradead.org; Tue, 08 Dec 2020 19:24:55 +0000
Received: by mail-pf1-x442.google.com with SMTP id c12so7754683pfo.10
 for <linux-amlogic@lists.infradead.org>; Tue, 08 Dec 2020 11:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=t3WOl358dt0CDoScwgClIE5ynsRAkRb5i51bvq2hopY=;
 b=fJ99rhjl/cqzr7cyXlf8RIIV9PFjN+cJ5morfBF7MpVUwi7qwu1gzOdUCUP4Il4hyR
 bIGXdb7g5oqnkHIbxjl0/xNy8lRDF3t6sn2S+JuVEz2mdPHWwL7d5kvoUMu2vxChP8AB
 RNrbCKzKAOvLPSPrO1g804NYW/LDo2X/kJw5gDt3zxu/0DeQgFplQiGw4/+3r12rBkC+
 6ZBMgbaRDMNFIOJXNew0vBP4Nw0sxGIrRyJf+rD037DNj5v+HhSe9MkC+6E+Nk6+0rkh
 ZBTW5/GHasUj4m9ItfBv/Qg1ujsbHGZ9Lg7FGpFaSLWgmYay7kcs0gtFZHIH0L3DuN67
 Zz5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
 bh=t3WOl358dt0CDoScwgClIE5ynsRAkRb5i51bvq2hopY=;
 b=mwogfy3dt2vIy8weiSqvWd7nDg04Ts3lf1ounqRYL3VRhgjYYxJWNE7f80DWpB0EwX
 Lo7hw4GbRlzP0aVsqheZ7fiy8thqN01VeAWgoeCAdKEHt2c9eDXQ4PiSD26oplQRM95v
 MzCB38rox6rUkQTyDJMPlrV7zRXqHTYyHzRuDKMAmCZWhKN1Chgrrm3rQd9K67hGU3wR
 ykc+ihAHP0vPMmlLkq6XxU/zH2h0DGyq7RDlCs5aVsS6lacM6f9Vlykz2BDlNpVlYqL0
 9Up9NEi+uZn9OUzQLd1GMx1/uiwnfalmbrcrE+KINRyxnUeWCiQ02mAcj/SGy8ESQ/bG
 FbRw==
X-Gm-Message-State: AOAM530ck5YjmZvI/1xWGD/0pf4TiVStYpe/hDJAT/6O42SsJuyX2+Pl
 NUP7WIr/kPghfTEYB5IpwSy92g==
X-Google-Smtp-Source: ABdhPJwsqnJJlR+MVODg7zivdCnmlrnej9e2ctd3tMENGWyM0q6ixab37dLdteDqHFH0qe8x9iT+Ag==
X-Received: by 2002:a17:90a:6393:: with SMTP id
 f19mr5750654pjj.227.1607455492521; 
 Tue, 08 Dec 2020 11:24:52 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id p1sm20179911pfb.208.2020.12.08.11.24.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 11:24:52 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Subject: [GIT PULL] arm64: dts: amlogic updates for v5.11, round 2
Date: Tue, 08 Dec 2020 11:24:51 -0800
Message-ID: <7ho8j4gkxo.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_142454_653380_4370D30D 
X-CRM114-Status: UNSURE (   9.62  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
Message-ID: <20201208192451.5gtoodSj7nqPDHT0-i_w4HQQhWlSmjKfhg6dPWeYoBQ@z>

Hi Arnd, Olof,

Here's a final round of DT updates for Amlogic for v5.11.  Based on top
of the first round.

Kevin



The following changes since commit b6a1c8a1eaa73b1e2ae251399308e9445d74cef7:

  arm64: dts: meson-sm1: fix typo in opp table (2020-11-30 16:12:46 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-dt64-2

for you to fetch changes up to 7704b100719cf0fead976a1bc839c60ee552d045:

  arm64: dts: meson: add i2c3/rtc nodes and vrtc alias to GT-King/GT-King-Pro (2020-12-08 09:48:45 -0800)

----------------------------------------------------------------
arm64: dts: amlogic updates for v5.11, round 2
- audio support for several more boards
- PHY timing fixes

----------------------------------------------------------------
Christian Hewitt (9):
      arm64: dts: meson: add audio playback to a95x
      arm64: dts: meson: add audio playback to khadas-vim
      arm64: dts: meson: add audio playback to khadas-vim2
      arm64: dts: meson: add audio playback to nanopi-k2
      arm64: dts: meson: add audio playback to odroid-c2
      arm64: dts: meson: add audio playback to wetek-hub
      arm64: dts: meson: add audio playback to wetek-play2
      arm64: dts: meson: minor fixups for Khadas VIM/VIM2 dts
      arm64: dts: meson: add i2c3/rtc nodes and vrtc alias to GT-King/GT-King-Pro

Neil Armstrong (1):
      arm64: dts: meson-axg: add GE2D node

Stefan Agner (5):
      arm64: dts: meson: g12b: odroid-n2: fix PHY deassert timing requirements
      arm64: dts: meson: fix PHY deassert timing requirements
      ARM: dts: meson: fix PHY deassert timing requirements
      arm64: dts: meson: g12a: x96-max: fix PHY deassert timing requirements
      arm64: dts: meson: g12b: w400: fix PHY deassert timing requirements

 arch/arm/boot/dts/meson8b-odroidc1.dts                     |  2 +-
 arch/arm/boot/dts/meson8m2-mxiii-plus.dts                  |  2 +-
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi                 |  9 +++++++++
 arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts         |  2 +-
 arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dts      | 17 +++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts          | 18 ++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi      |  2 +-
 arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi           |  2 +-
 arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts       | 42 +++++++++++++++++++++++++++++++++++++++++-
 arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts     | 40 ++++++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts        | 42 +++++++++++++++++++++++++++++++++++++++++-
 arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi       |  2 +-
 arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dts       | 40 ++++++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dts     | 61 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi          |  2 +-
 arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts       |  2 +-
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts | 43 +++++++++++++++++++++++++++++++++++++++++--
 arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts      | 46 ++++++++++++++++++++++++++++++++++++++++++----
 arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts        |  2 +-
 arch/arm64/boot/dts/amlogic/meson-gxm-q200.dts             |  2 +-
 arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts         |  2 +-
 21 files changed, 361 insertions(+), 19 deletions(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
