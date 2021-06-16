Return-Path: <SRS0=o3rk=LK=baylibre.com=narmstrong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46100C48BE5
	for <soc@archiver.kernel.org>; Wed, 16 Jun 2021 06:26:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2793F6115C; Wed, 16 Jun 2021 06:26:43 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99504610A3
	for <soc@kernel.org>; Wed, 16 Jun 2021 06:26:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99504610A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=narmstrong@baylibre.com
Received: by mail-wr1-f52.google.com with SMTP id v9so1249624wrx.6
        for <soc@kernel.org>; Tue, 15 Jun 2021 23:26:42 -0700 (PDT)
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
        b=WlBbogKp6T0UtW/EjewV1AxbcGNdhYi8OuztK6TbBV6azAvsWbNIsLrYT361dZPFJa
         4Bwv7HMkgE7Y897MNQuZGaXLx1rt4ofiw8HHc81t4ZTqIG0yP9QM5IM6veTzeSobh7ZB
         Wtxjwdg+/m3IE1PRZ/Rawhj+DK2cBiEvoLKGZ0x1z/aWIF2EqkFmd8XSLYKu+tBeRzGg
         sWb19coqbH0EIaBYysa8zDdgwspJQ3E4DwOwHdXBDkJSBPg8PDtMvsCg3pLN/Bn559Ve
         vzEgjV9cb90GNBm3eoMi5hTbCjQ1y7BtVDImjPeaK4gU44f2Cd4NHJpEbAUJOD/REPxO
         TnHg==
X-Gm-Message-State: AOAM530qSVylJnPHcarlvjEpFuIhnNy07HBi1bAnq2aOe3BdHAgDFd+J
	8z9FihYx9QEKtKmrfChmDGt0uQ==
X-Google-Smtp-Source: ABdhPJwnvVrbJrc08xWRwzZkjlaf87sFoa21IIx7Dzs7dM9rL13iCvppqBA4oIJ8QvM2OImiMwjL1Q==
X-Received: by 2002:a05:6000:551:: with SMTP id b17mr3268542wrf.32.1623824801282;
        Tue, 15 Jun 2021 23:26:41 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:6b98:6d35:fe47:b739? ([2a01:e0a:90c:e290:6b98:6d35:fe47:b739])
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
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

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
