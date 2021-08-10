Return-Path: <SRS0=SoTB=NB=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00924C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Aug 2021 07:48:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 701F460F11
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Aug 2021 07:48:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 701F460F11
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Cc:To:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eXGX5XGuWvpd8vwiyxxPZFSy4S/OIJoYHn29O6cW+a4=; b=NknNU03WQoXeU9
	UQtEOVLh3EAmgpoHmRMqlW0Ths1Lsjz1c7wlMjq9GOcP1w0Lhorxd+CHkVj7h8U3x51UdwGeI9OSl
	4Ukqx4nqCNDzi9o9KvBel2KtSWvKbSY5bncRwAUceDzwaDmkpqDIJxRICjfmbf9WcoUd8TssWVvtz
	WmM/AU+6gQeC8v5E4NUdXktGNZfKe6AuWbRiMjviM032N6W4m707FFfP7UIu0Zbdi8sv3/aMpigoc
	KGTnp3+A7Vn63FBw61kdsmKnipCSxhNSBA3ClumcIuY0czM26t82UpiQqjokbTS370JF9tc528h7q
	KIIuwear+nXpK+OTKdpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDMS0-002n60-ED; Tue, 10 Aug 2021 07:45:28 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDMRv-002n4h-Mi
 for linux-arm-kernel@lists.infradead.org; Tue, 10 Aug 2021 07:45:25 +0000
Received: by mail-wr1-x42d.google.com with SMTP id f5so9176328wrm.13
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 10 Aug 2021 00:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:subject:to:cc:organization:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=g0q3kphIrx1VxRV2EMS6AqhVMyTrmhZVikt1UVfC9jE=;
 b=WWp6Iu9NUui8IEaytPZW4o7A0jVEUvskeillsHJfoOChJizlMPG1d6Kx5vrEDABHxB
 otLUUp3g7SfpxHDtIhGnLjIYRrN4CkkZbSaXhtsX73ySURG9Uif6ABvLLYSggwT/E5pe
 sH1AQKhtobTDi9Vl3a3tAPNzuBKI3EeOk1JIGcq/4NB6PBCRnRL4AuQEwpejCZok/AuD
 I4xqX8a7XLG6cQ6MPB352+VA/cw3Iywkt+rIJIa88vZCOxphd89xyk5CZQPKb0qvA8fv
 qS7Vg8cgF7CBNFbwLNJtkJd+ToYZTygkO7cSCJkcrsgl1x15K+jDr9kbDv67Ut2KDndw
 fwVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:organization:message-id:date
 :user-agent:mime-version:content-language:content-transfer-encoding;
 bh=g0q3kphIrx1VxRV2EMS6AqhVMyTrmhZVikt1UVfC9jE=;
 b=FDZKxucwFpw+xFLwJtmZoKbHkFx15ye4Yl6RlUmIhvu/sRfPRxYaMdmSeJfSTfyGwm
 rQOWhwsVcZmkKU/p+Zik8zszXHdt4MW+fAraVV6QyNjMn6wk08SvxMXcPx8cqFCkDUV5
 TI6PDn4onDfatj2lhpyOSY1wY3YdU60/n8LErNFDz15weiZBCjKk3OV/3i7d2J+Fk0Ts
 zvMzT/P4UZAuN5aqBwPVRxWEJiq7iNdaNUIL3FrCB7IuniIe9UOUfrR2pCZJ8ss71XdP
 X4dVS2DzYmMeEVXW+XIl3RjWKBENQsAY2G5ZcdPHVy7b1HHYpIflugybyODF0SwMIRfF
 zqVA==
X-Gm-Message-State: AOAM532o0f7pJyP7uarUf3UfR/GyUF2seF10LZqqIe2p6PcsJB6b9nm4
 q9HyN+NxKHR5++6FpCJ76lehwA==
X-Google-Smtp-Source: ABdhPJx064E2x1aqMgErJdQ7uvxV1ZcoE7GSSdceTUKAusQAu5ZofzMW9b96EIF+QoG9h0905lxZ3A==
X-Received: by 2002:a05:6000:225:: with SMTP id
 l5mr29983665wrz.242.1628581522006; 
 Tue, 10 Aug 2021 00:45:22 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:b710:2b6e:27aa:f0a0?
 ([2001:861:44c0:66c0:b710:2b6e:27aa:f0a0])
 by smtp.gmail.com with ESMTPSA id s10sm10377416wrv.54.2021.08.10.00.45.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 00:45:21 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [GIT PULL] arm: dts: amlogic updates for v5.15
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Organization: Baylibre
Message-ID: <87519792-c9e7-76a6-5db5-0e955286b564@baylibre.com>
Date: Tue, 10 Aug 2021 09:45:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210810_004523_831667_B9B98B91 
X-CRM114-Status: GOOD (  12.09  )
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
Message-ID: <20210810074521.GKvn-OI4OinFT9J84uh45HqdmnmdfAFp5ItxjJmYOVY@z>

Hi,

Here's Amlogic ARM DT changes for v5.15:
- meson8: use a default higher default GPU clock to solve probe failure
- meson: add AIU audio controller and codec for ec100
- meson8b: fix pwm regulator supply property name

Neil

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm-dt-for-v5.15

for you to fetch changes up to 72ccc373b064ae3ac0c5b5f2306069b60ca118df:

  ARM: dts: meson8b: ec100: Fix the pwm regulator supply properties (2021-07-26 10:05:36 +0200)

----------------------------------------------------------------
Amlogic ARM DT changes for v5.15:
- meson8: use a default higher default GPU clock to solve probe failure
- meson: add AIU audio controller and codec for ec100
- meson8b: fix pwm regulator supply property name

----------------------------------------------------------------
Anand Moon (3):
      ARM: dts: meson8b: odroidc1: Fix the pwm regulator supply properties
      ARM: dts: meson8b: mxq: Fix the pwm regulator supply properties
      ARM: dts: meson8b: ec100: Fix the pwm regulator supply properties

Martin Blumenstingl (3):
      ARM: dts: meson8: Use a higher default GPU clock frequency
      ARM: dts: meson: Add the AIU audio controller
      ARM: dts: meson8b: ec100: wire up the RT5640 audio codec

 arch/arm/boot/dts/meson.dtsi           | 12 ++++++
 arch/arm/boot/dts/meson8.dtsi          | 68 ++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/meson8b-ec100.dts    | 48 +++++++++++++++++++++++-
 arch/arm/boot/dts/meson8b-mxq.dts      |  4 +-
 arch/arm/boot/dts/meson8b-odroidc1.dts |  4 +-
 arch/arm/boot/dts/meson8b.dtsi         | 63 +++++++++++++++++++++++++++++++
 6 files changed, 194 insertions(+), 5 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
