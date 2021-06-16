Return-Path: <SRS0=alP7=LK=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29B2DC48BE5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jun 2021 06:28:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2694613D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jun 2021 06:28:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D2694613D9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Cc:To:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=V3jOC5k29mJPf/Tqpt6mwpRVj3QJniDuo7y1Aah+q7s=; b=enY4XgEFNIFVjw
	nMkPxMxON+4Fo2uqwOpDfRtnbZ8apSG05Gx21EhQumjOX1M6TrygcTsWjr/g8Twt3M/8lTY86RveQ
	yNG7xPqNKl7XMT2499eUB0uU/4af/Zq5ZiNKtwSBygxBJj1lgdXA6GP7Vk2mSVFJSbiy/kozXq7Fy
	1TkmJgLBCe/8+BCCmUsuHUQmBpISgSwjlGVMsuH3XuZGchKjGOISPhTDwQzfUW3P6A5tkdW9tSRYg
	s44dRKZru4wFgF4hmZVrQAFs2H/Fgnl3lYj2o7U7mfbXymeMdYHdKYT+aCx4iKXtk2FNHhMM4DTJJ
	ZKXHgM/d86tv/+Nshhwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltP0g-005276-Vs; Wed, 16 Jun 2021 06:26:47 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltP0c-00525K-GF
 for linux-arm-kernel@lists.infradead.org; Wed, 16 Jun 2021 06:26:43 +0000
Received: by mail-wr1-x436.google.com with SMTP id c9so1256003wrt.5
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 15 Jun 2021 23:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:subject:to:cc:organization:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=eX9KilfronaU4zvtDptmHzHYmMu18MlAQnZ0ExpHWcc=;
 b=C+C2r9TORvCO/CwzPrYXcik854Fg5EAT7f4aO9xSIOdfgGaPEKZf1ChYid0u5vLCo7
 JjNCPli63EwE5EIOhpl7fTigSXIM0SP4x7h00vxwRJaVhU963Yc95IJRaxaWHhpAdVDo
 bdQNEQybEZfslkpndL6fVAK92JoWtGEMtZWVyaU+qkUUtBcfCxkvZ/3PONjpqO23o1Qt
 OXwbwKscukYcsVB8FDT+3xLZmoMrgVUxFKiHHJiIks+7fTobmfRQWPfG6ffDoYCYp9pC
 dzr/1qjvHpt42fD908pXgBiquDHZYsffipWLios57hbVyoGlBoz/ff731OO7CSw/eknS
 rq8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:organization:message-id:date
 :user-agent:mime-version:content-language:content-transfer-encoding;
 bh=eX9KilfronaU4zvtDptmHzHYmMu18MlAQnZ0ExpHWcc=;
 b=fm5bF6MIiySlImeg5AqnkNQT8ITr7kqqsGA/CNzCZtPMZ2tXDLn4cLMY9X5hjiiMFs
 /Az9aCYNTdfCRPsMJPb5vEuFE6empdgJvl/LEKF5HK2k322upMBs3o7cauL/EkW5vhw/
 4oprrTOOlBDKwJxRz+yKIPO3slCVbiJoG4tZ/k8AaX817FoN6IuOo+dBYDaRvue+iLhI
 +vJOQ9iAirFZRUmgC2+Qu1nUKhFuqfLYMDeOElCGJm6OxkOgRU7iqW2uV3rXej8l6b+V
 jljcAFnInCHsh+E9uNCF4fBOAIpoDHnoQjG5/PBnghP4/Ufu304fUtX4Lw5eCFzPMkws
 aFlA==
X-Gm-Message-State: AOAM530vIVxoKKdsQT5L6okoL49lwTpiXyByuAoNQEptS55JhbmGltPT
 bjWSeTHQaLSXL8z5ywR1dNESoQ==
X-Google-Smtp-Source: ABdhPJwnvVrbJrc08xWRwzZkjlaf87sFoa21IIx7Dzs7dM9rL13iCvppqBA4oIJ8QvM2OImiMwjL1Q==
X-Received: by 2002:a05:6000:551:: with SMTP id
 b17mr3268542wrf.32.1623824801282; 
 Tue, 15 Jun 2021 23:26:41 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:6b98:6d35:fe47:b739?
 ([2a01:e0a:90c:e290:6b98:6d35:fe47:b739])
 by smtp.gmail.com with ESMTPSA id n1sm839334wms.18.2021.06.15.23.26.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jun 2021 23:26:40 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [GIT PULL] arm: dts: amlogic updates for v5.14
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Organization: Baylibre
Message-ID: <2f19a5a1-3ed9-dd11-02f1-7d535cb1c25c@baylibre.com>
Date: Wed, 16 Jun 2021 08:26:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_232642_598282_C6B53558 
X-CRM114-Status: UNSURE (   9.97  )
X-CRM114-Notice: Please train this message.
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
Message-ID: <20210616062640.w_RA5VNlvJK6sR3pzN8w0IfdYBFB95yCE5ZzCUkHPVo@z>

Hi,

Here's a single ARM DT changes for v5.14 to add UART FIFO size like the ARM64 SoCs support.

Neil

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm-dt-for-v5.14

for you to fetch changes up to 7db3cde5123e2acdd65ff7458628a9835c804b27:

  ARM: dts: meson: Set the fifo-size of uart_A to 128 bytes (2021-06-14 10:00:50 +0200)

----------------------------------------------------------------
Amlogic ARM DT changes for v5.14:
- Set the fifo-size of uart_A to 128 bytes like the ARM64 counterpart

----------------------------------------------------------------
Martin Blumenstingl (1):
      ARM: dts: meson: Set the fifo-size of uart_A to 128 bytes

 arch/arm/boot/dts/meson.dtsi | 1 +
 1 file changed, 1 insertion(+)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
