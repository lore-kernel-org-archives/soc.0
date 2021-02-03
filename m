Return-Path: <SRS0=mi7Q=HF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FEABC433E0
	for <linux-amlogic@archiver.kernel.org>; Wed,  3 Feb 2021 19:25:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1142F64DF5
	for <linux-amlogic@archiver.kernel.org>; Wed,  3 Feb 2021 19:25:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1142F64DF5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FxhliAWn59bXVaLRXvAzKzguLpfObvACfKmkjijx15A=; b=U78IBEyeplrw/ZPANlgJPxg+x7
	9T6wyWrM+XiHGjHvdsjq3qySQX/DFcqVikE5QE2l/JTd3Imlp9ja7q9Yjo1IPIatRcO1COp+Z5Z5V
	OVIU0qenYEXbt4S4tAgQIdhIJPSWvxwHAtXHmAxv1xAHkHL2yBbwmeOBm2Nhut1afMDaa12+ar7r6
	vsXKppPl8EQFChcDDl73rqLlhtc6P5Yo/bsua1cogaWwRSEr9yBOmLysCaTGzZyMEXwpuTD8efqjH
	SeBIFURCiwDPnOKPj0vh1B1sCdQMLOX8JsPrt9oxgYc/O3vVix6ejTuomxBMp8kRVDm9X9scFpFFo
	cISuWbJw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7NmK-0000tK-RM; Wed, 03 Feb 2021 19:25:28 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7NmJ-0000sd-CJ
 for linux-amlogic@lists.infradead.org; Wed, 03 Feb 2021 19:25:28 +0000
Received: by mail-wm1-x330.google.com with SMTP id y187so754757wmd.3
 for <linux-amlogic@lists.infradead.org>; Wed, 03 Feb 2021 11:25:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=x3faUe3ENc8XDGqlqmMZYsoReEXRHgzJw6DbiwpAh60=;
 b=HXZUIAq6jGAzzYxnud9rmONH+wjdL3aR33PloIVIw+UemVo1YX3gnK/XCv+hU/THrG
 HvXVszkaWZsYE0hMCtrvO+Gfl2hewL6CdJVEZrK00BcKbb+OO7CTOVfp4/HJMscyksr6
 Yup2BETZDgRVQtsN/CywUpFOenwLrGttAaUbRA2Y+JuZiOEBR8M55R7fr3wxXz47ISE6
 XxRKI+R/OntPLyitJ1RPVEVdeP/TOGXzLc7nYDKeb15BF4zVF3jdak8pZF0xH/k8wNcF
 n65v4daeTrrJpeFHCMjqXMzN22h0h0lSstqpcDkPaBk8E48AxxaeqolC7XFRb08a41GM
 ZdHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
 bh=x3faUe3ENc8XDGqlqmMZYsoReEXRHgzJw6DbiwpAh60=;
 b=c132GU5o/01fdl1xVHAPeQlbTPQot/VRqBvVvt3Q7m3WzZMIpZWNvBssFKPkXx5EDM
 YbGzrKRKFKab84UbYUtwAJDadVyYILlH61LYNcHFCSl/GTJzPdXcj+PpcRB2Hn5gqRMk
 CtoXMj0d3UEm5AFmCYp7+X9s5qvcIrzg+IT2q+sKvBmic8Ok826DJYyesBQd5PnpYUCJ
 X0nlA22rPAZ+JANz/0pdayI+tX4SeQsYGw76p9St5QI/sdBceYxHvYG/MBGIiUDEMQjD
 OXomy+hBZZiiMG0KPpRRn2rd4p5tSNEyuooj9/ewIZy476pI3Foa+bV0fcvKsUsvQbI8
 jKgg==
X-Gm-Message-State: AOAM533oJ9QURRdFWQgtSEXbiZM/OXsiLwsV+wOhjD3ibYoht/uwjljq
 D8GmHioxG8EkQP5peT0Lg5oZzQ==
X-Google-Smtp-Source: ABdhPJyam34LSR7c8LzBz6n9HrSk70jFtD+yAN8T7ZOW/VSvTSfJRlobznT0vJO6YQMWHuXZrcHsVw==
X-Received: by 2002:a05:600c:4f88:: with SMTP id
 n8mr4282178wmq.34.1612380326252; 
 Wed, 03 Feb 2021 11:25:26 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id e11sm5000531wrt.35.2021.02.03.11.25.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 11:25:25 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Subject: [GIT PULL] ARM: dts: amlogic updates for v5.12
Date: Wed, 03 Feb 2021 11:25:23 -0800
Message-ID: <7ho8h12bto.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210203_142527_432857_13D24C45 
X-CRM114-Status: UNSURE (   6.61  )
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
Message-ID: <20210203192523.yvDfmjNX5w3MVyXO8L1-HpokR1f1eT1ezq_Lbgg9_Ns@z>

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-dt

for you to fetch changes up to 9073f694efd8733b0e7c97d3396d81161bd05582:

  ARM: dts: meson8b: add the thermal-zones with cooling configuration (2021-01-25 09:46:44 -0800)

----------------------------------------------------------------
ARM: dts: amlogic updates for v5.12
- add thermal zones with cooling configuration

----------------------------------------------------------------
Martin Blumenstingl (4):
      ARM: dts: meson: move iio-hwmon for the SoC temperature to meson.dtsi
      ARM: dts: meson: add the ADC thermal sensor to meson.dtsi
      ARM: dts: meson8: add the thermal-zones with cooling configuration
      ARM: dts: meson8b: add the thermal-zones with cooling configuration

 arch/arm/boot/dts/meson.dtsi              | 12 ++++++++++++
 arch/arm/boot/dts/meson8.dtsi             | 54 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/meson8b-ec100.dts       |  5 -----
 arch/arm/boot/dts/meson8b-mxq.dts         |  5 -----
 arch/arm/boot/dts/meson8b-odroidc1.dts    |  5 -----
 arch/arm/boot/dts/meson8b.dtsi            | 54 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/meson8m2-mxiii-plus.dts |  5 -----
 7 files changed, 120 insertions(+), 20 deletions(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
