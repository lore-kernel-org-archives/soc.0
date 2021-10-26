Return-Path: <SRS0=ATq6=PO=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB4E7C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Oct 2021 09:49:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B32EA60EC0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Oct 2021 09:49:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B32EA60EC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7bPbIalY3AAwADtPwe+TVwM9jTnUz/uTEJMpaiZOTkQ=; b=qAxs/McTZCMLO4
	3sFXiUixAkGTS73dnT7NTPGCyir5e7PTaViOfVXPJXVdsH/4wxjnSKGcJeNWOcHL8Qkpj1a3jRa7z
	NZOKYLPqxflgtvoPzz+hdKrhCy/fDGP1AsAdIatzmis10yPFgGfRmD+Vr4lYnnQIVVVDSXBtiolQu
	jctj56b2RU7ctm+QwHEp+lm6/yV189qQLsR07h2WWG0I1LWsWQwRHRb0V/2U5rSeLmZuIp7BAX1J4
	AtEY773UrQKW3+vTo6uaPqDrUj8uA7o0yEv98nobwbu55giSdIPRSzlq3GKqmxpM0py5+sG0RA32m
	Hoi7obukBpCXgSJ+ZpSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfJ3v-001M8l-5H; Tue, 26 Oct 2021 09:48:07 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfJ3H-001Lxq-ML
 for linux-arm-kernel@lists.infradead.org; Tue, 26 Oct 2021 09:47:29 +0000
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 07FD43F332
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 26 Oct 2021 09:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1635241646;
 bh=rL7wDI9BhVHC252CW+CxxpCQUhhfA8amv8WUbteCqVg=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=I4xrG7cFUuVFPxYscuJIyVVTvzcg0w2TXZ9iPpO1GTdWPBi9rtTUoy8oYpIWWCsQH
 al9tn1CRei6UYnZZZYyCnvtfI7LU89IeyjwYPnMSQe9jYpXS6HIXmFZGPgjTBQN9Fe
 L+aqHa97Ng7yqoLRgGJTO9coGrIBSMIugDb7evk8CzKleZ2L19OyJkKT4WE4mjqZSz
 ko/jARznL0pUyf1CgMEL/5beHYg9bgNbzBdVNzl9wv8U1rdhLJjxOaAtMK7hzecsWR
 BJHDeanz+VYP791IUyaz4FngRu0UJLq/mL8dCvviCtbyyuDfPPLyVv1Qj7f8Oi8cvI
 LboW2PRxKNOTg==
Received: by mail-ed1-f70.google.com with SMTP id
 s18-20020a056402521200b003dd5902f4f3so2093673edd.23
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 26 Oct 2021 02:47:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rL7wDI9BhVHC252CW+CxxpCQUhhfA8amv8WUbteCqVg=;
 b=StbpINYbKGQpyFxx07fViJMMdswntvQF5Xo/efh+oWjuzuBEsy+4s6LCmU5k0ALb9r
 VmMOSpI04qGVVzRusnDH9DhUCab94nY6DqvdBBJux1pA/6UKha/qO/V0rjuJuZh7ilTl
 dyCcuOo+w/1JFxAKek67YUZ3vRJVYoVGOjr0YOlWIpQNDhP9EMP9J4nad9a9eOI9fNEa
 OaMfcRS6KxSYayomf2Uh5vZr2C7yWab2wvktx6dTuoDSy0utgJ3BP2kPp5Ni8TI9QzVz
 TYjfxPS9fJnNlyFVoipaMYKJdko33iGjAlzqWY4W5c2uMZHkR4HLmhJbgLtuixOT5nkI
 BdWg==
X-Gm-Message-State: AOAM533NSKpT8CvKuwgboGIzOtLpLKO+etwBm0BpKI2cB0ptrczdCheM
 DiUtBKsrD+GYYblao8/6eoUEteX+ave/4iOPY7hfDoAatB9fcKY1ZxqUNxWc11HhU/RhMgfkD44
 kgW/C8UM2cnQ7hKrnJx0mdKG5GXRfn9SFvX0hwoaxQZrlIxzkHYZ4
X-Received: by 2002:a17:906:9b88:: with SMTP id
 dd8mr30284430ejc.467.1635241645548; 
 Tue, 26 Oct 2021 02:47:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyj15dtEVfN26R0cv7huGEYK/rYbVAl8R0+VUld7zFjW27HL1TfRHGuG6Mr78Cler2U3kJh2A==
X-Received: by 2002:a05:6512:1190:: with SMTP id
 g16mr21983643lfr.609.1635241635178; 
 Tue, 26 Oct 2021 02:47:15 -0700 (PDT)
Received: from kozik-lap.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
 by smtp.gmail.com with ESMTPSA id
 v17sm113794lfo.167.2021.10.26.02.47.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 02:47:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
 arm@kernel.org, soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] ARM: dts: samsung: dts for v5.16
Date: Tue, 26 Oct 2021 11:47:07 +0200
Message-ID: <20211026094709.75692-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211026094709.75692-1-krzysztof.kozlowski@canonical.com>
References: <20211026094709.75692-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_024727_890312_CDCE9C24 
X-CRM114-Status: GOOD (  10.31  )
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
Message-ID: <20211026094707.D8pmmTmTcI8S7oOLTAyEGkhih04-wc4XLTOahV3sXzk@z>

Hi,

On top of previous pull.

Best regards,
Krzysztof


The following changes since commit 7ec804d6025c952e3122ad7fe768178efca3300e:

  ARM: dts: exynos: use spaces instead of tabs around '=' (2021-09-30 13:45:55 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-5.16-2

for you to fetch changes up to 7b06c1ad884ee80e43604ba2a0bbc5f8ef3524e1:

  ARM: dts: s5pv210: add 'chassis-type' property (2021-10-19 10:57:40 +0200)

----------------------------------------------------------------
Samsung DTS ARM changes for v5.16, part two

Add chassis-type property.

----------------------------------------------------------------
Krzysztof Kozlowski (2):
      ARM: dts: exynos: add 'chassis-type' property
      ARM: dts: s5pv210: add 'chassis-type' property

 arch/arm/boot/dts/exynos3250-rinato.dts         | 1 +
 arch/arm/boot/dts/exynos4210-i9100.dts          | 1 +
 arch/arm/boot/dts/exynos4210-trats.dts          | 1 +
 arch/arm/boot/dts/exynos4210-universal_c210.dts | 1 +
 arch/arm/boot/dts/exynos4412-i9300.dts          | 1 +
 arch/arm/boot/dts/exynos4412-i9305.dts          | 1 +
 arch/arm/boot/dts/exynos4412-n710x.dts          | 1 +
 arch/arm/boot/dts/exynos4412-p4note-n8010.dts   | 1 +
 arch/arm/boot/dts/exynos4412-trats2.dts         | 1 +
 arch/arm/boot/dts/exynos5250-snow-rev5.dts      | 1 +
 arch/arm/boot/dts/exynos5250-snow.dts           | 1 +
 arch/arm/boot/dts/exynos5250-spring.dts         | 1 +
 arch/arm/boot/dts/exynos5420-peach-pit.dts      | 1 +
 arch/arm/boot/dts/exynos5800-peach-pi.dts       | 1 +
 arch/arm/boot/dts/s5pv210-fascinate4g.dts       | 1 +
 arch/arm/boot/dts/s5pv210-galaxys.dts           | 1 +
 16 files changed, 16 insertions(+)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
