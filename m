Return-Path: <SRS0=Ct1D=M2=baylibre.com=khilman@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30867C25B7A
	for <soc@archiver.kernel.org>; Thu, 23 May 2024 17:39:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E580DC4AF09; Thu, 23 May 2024 17:39:00 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 80F2CC2BD10
	for <soc@kernel.org>; Thu, 23 May 2024 17:38:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 80F2CC2BD10
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1f332528c1aso13398725ad.2
        for <soc@kernel.org>; Thu, 23 May 2024 10:38:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716485939; x=1717090739;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L/W0Vntg5VnIMxSV71l0bmPcwI99/cfB5C3Aav0qviU=;
        b=pETZ9xqXue/FCB5xtV40eKSBniyOYkvdI+8pKagGRE8gsKWAa01wAgPWkZKGAzPXy3
         +4/zOiYpuRuETBF1hRAWE9oxMqkLxve95boQodUYXBxd2UDMU3ZZTxrbBQxEaRzM2O8E
         b6HbyXqYZNk5lXTkyAX1R54M5Rd7unZ/XC8OGe1BaS7r2GQyje/fXJD8HLTU++uLLkBA
         yR7HjWOX5wx9zJIoOkCSevZvbaLpQBKUVua1vu/XNSs/0AceV5jG3YMVEhSBYAxIKDXS
         5fzb5PfoagTI2DWjI47nQAuEs9lp0LIA5tduLPCYzz5aDBIEQjvHUY7ebxgvN37btj61
         UJDw==
X-Forwarded-Encrypted: i=1; AJvYcCWXVSZG4E/SjgIoMRzo4Crgz3NKkTgcfpv+v8j1+g2/QHyHYcDTIV3QQtSBD85cfHI6MvkHRkRRr/rRxIhyvQ==
X-Gm-Message-State: AOJu0YyFgp0VSUhv36KiJAy5ioI1wgzBk83w0uEgmqOhalKrCa+7+pZd
	ZqVW3yt8w2NxrdIxNkrC+bMHoixkYMuRBpL1BgnAATUz3yXZsW0Z5p6VODQBRTE=
X-Google-Smtp-Source: AGHT+IGNADe/wyzsEZ266Ywm0cLtpbI9AmZBl0HV71wuiRh6eLHpIL1UEb3u967JpeQEc6fSHcuJww==
X-Received: by 2002:a17:903:228a:b0:1f3:1482:60d with SMTP id d9443c01a7336-1f449901aa6mr6505ad.61.1716485938797;
        Thu, 23 May 2024 10:38:58 -0700 (PDT)
Received: from localhost (75-172-111-169.tukw.qwest.net. [75.172.111.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f30358e6d2sm71520115ad.93.2024.05.23.10.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 10:38:58 -0700 (PDT)
From: Kevin Hilman <khilman@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Arnd Bergmann
 <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, arm@kernel.org,
 soc@kernel.org, Antoine Tenart <atenart@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Tony Lindgren <tony@atomide.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Benoit Cousson <bcousson@baylibre.com>
Subject: Re: [PATCH 1/2] ti: omap: MAINTAINERS: move =?utf-8?Q?Beno=C3=AEt?=
 Cousson to CREDITS
In-Reply-To: <20240520074013.9672-1-krzysztof.kozlowski@linaro.org>
References: <20240520074013.9672-1-krzysztof.kozlowski@linaro.org>
Date: Thu, 23 May 2024 10:38:57 -0700
Message-ID: <7httio2zta.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> writes:

> Last email from Beno=C3=AEt Cousson was in 2014 [1], so remove him from
> maintainers of the TI OMAP platform.  Stale maintainer entries hide
> information whether subsystem needs help, has a bus-factor or is even
> orphaned.
>
> Beno=C3=AEt Cousson, thank you for TI OMAP contributions and maintenance.

Not sure why Beno=C3=AEt is not cc'd, so adding him now so he can ack.

Kevin
