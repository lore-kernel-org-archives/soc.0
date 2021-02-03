Return-Path: <SRS0=Uajl=HF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51DC3C433E6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Feb 2021 19:26:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA86A64E39
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Feb 2021 19:26:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA86A64E39
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cG+NZOZ4m09U0pY5JdKkBP5is9cLIXHVYJKrWGo/ZdI=; b=s7rnNuZlad1Kw3xVAG+gSIXZ9O
	faLKe+Chs530tuRQOr2ziELG61Hb2G0nLac4zvkmtAXur+2UfYU0Zf6CRQ6d+bag+rNL4RtcmVZzl
	aCZH/h/Cl2PIGvcqeeOFjB+a/fQPHFkunlEsvb4hGWd0sHFyqn6QeRsUUWm7fB0aPvSLSi7z+mqY9
	IlCNXMcyoFk7uoLBruBZCiLUem7Hod3Yw8f8ClAaKGxzm/9hVWepN0NuaT9Bo6EoTZaySokaoiB6m
	0qgRE8fHHJYDgFrYLWLTM35sWXYIPS2aS/hwvJvXRpo52O/WS7JYxl7OwAXQNrY9/L7MypmHy5l6G
	P4SSGQ5Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7NmM-0000ti-Ms; Wed, 03 Feb 2021 19:25:30 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7NmJ-0000se-N1
 for linux-arm-kernel@lists.infradead.org; Wed, 03 Feb 2021 19:25:28 +0000
Received: by mail-wm1-x329.google.com with SMTP id w4so827936wmi.4
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 03 Feb 2021 11:25:27 -0800 (PST)
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
 b=lvytDOZb963fObpRpbOHmP4QOFyF0Q2v9ljxWGXlH0TZJzSfZIbkPkLgQM608msXzz
 66GD1zmKdk+p5i/8MaMXGOlDB9X9YjLZiphtpBqm1Vq5Rx3XNAiWc7ZNgKp+IABcaEqs
 tbaA4DRd31LDs0ZZB+gEr83Nbrq4poPRLKF+orD/gc1wXIfPquvYDywgQt6XTpgV0Ju5
 EiI+D/KKed9HCpuZp2Z9L8yM0T57qFibIvnKaJfTVNLEhK24TMOK0hpWAsceVaY52lEY
 L5EMl/w7pVia64BxgoM51GYTy/8qww6seeEUeYJTliJ85NfNu5S7iUNG+84LTe3oCjR6
 k3sA==
X-Gm-Message-State: AOAM533hDW+nyfsUrqqnl5UBcBIWImIc78JXTu5Qg/p44HbgtYKzEbqA
 4/ogbU1RQxax5x4Uhp21T7iK5A==
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
X-CRM114-CacheID: sfid-20210203_142527_779391_2D9B9853 
X-CRM114-Status: UNSURE (   8.07  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210203192523.y5no2FKRURfPf0E2ntqtS8cAhXgE1MSKV9AqwHOGksY@z>

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
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
