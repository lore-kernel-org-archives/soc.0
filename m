Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223B8265CA7
	for <soc@lists.linux.dev>; Sun, 31 Aug 2025 13:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756646898; cv=none; b=gj0X3TtUMNoAeoKyA4PU8mAEYjAx+x4S2FLIvwomlXqs0XEkWMQbAi9ohxnlZ+3hTn3OvGKMSHgVEH6H5YJRIDFPYpND5dau1dmpypjlMIrajCTCH5SNPT/2sP72imvWN8bOzK1MrYtyQfj7czyfphLHHejgfJGAE4SI1T+1EM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756646898; c=relaxed/simple;
	bh=4724Qznr91+tj8Y9/XUYmvNyXil/j8ZgBOQhRyA1BqQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=S0LgyssnBOhu02beSKk5UUDx55jxwTZ9neOROE0tVubaMkQuuAAU8KiQD+HUWUqoGc3mtDLGLQRXnIzIZe543e8zcAAYct6MKWjXQYFBaA8cDQrUhKPvIDRDuf633sfc5n2BqAKnHUIwVbm35SAJWsO3N8zPIMKlh2W/4XZJSig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OyL9h4Qx; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OyL9h4Qx"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3cd299b1833so442058f8f.3
        for <soc@lists.linux.dev>; Sun, 31 Aug 2025 06:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756646893; x=1757251693; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mD6lZo1DYlhz45rUzy85fH782HipOjBn1uPVn9HDDvM=;
        b=OyL9h4QxRaOD/0jIDXbkS/q/FU4s3MsGc10NTquGa2AVaBbAlwg9TeYKOzEtmQiXC2
         Ap/OduYoH4AGS2tknEAeYLhWrS2LZwoOUyFOcIYgZlh2VTJQ1SMZFYsHwKDDRcl7B8PT
         Jw04x90j1wuIsliIgzsq+dLgiHgMzsLr29z91C3EQ5VFa+5NMrto16VdonhbVFMD6rkl
         vhZ1nTzHHo2tUSYolmvkEbsS5wnDbB2LjkzMXqVdx6l7HLku63D1uZcPMhX51GcKCEu0
         +A9rl/K4R/il9Aa7H9ucbh5NLVdBsMrKpGUL2jbPJKC3V7qRIkTkgTqZSZDCnBm9Wabo
         fQyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756646893; x=1757251693;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mD6lZo1DYlhz45rUzy85fH782HipOjBn1uPVn9HDDvM=;
        b=eqX7NJonf74x/kx/eBkWy+ZyupvJRr2Gxulym2gn7QTK/Mm46xO6fuliTkOKyDMdr0
         eEU84f18JkQvGaaf37iSG7LPmo4NpMPkuvZtKfcF9iCsJapqOwUxhoXYy1Z1gIt372yi
         whMb6GcQ59dmAUZDP9E2NILL/TyfmQSbGcMMtuuDaojai2FrXSk1mNrlVjWauucSZAEv
         uWAZRGZ5bdUSvZ+v8h/k0G528zdDYbfzFnTHJuD4ARJkF7ReT1v4EhcRweKUu/hUUfYV
         Ct/svSAa1Hx+C3gFpj0tog08/2muLMEiZ2b+3rn7yEn63Twz2VjVig4Ryv5Gh1v00x4/
         bDog==
X-Forwarded-Encrypted: i=1; AJvYcCUmvWCEK8KQk490SP+tnZhxQYowVghWbah36W7CBcWIC8HlPaRg9YxUocLFA3hseR9woww=@lists.linux.dev
X-Gm-Message-State: AOJu0YzLW8zUgB8QJZ+h3qjBpFtKrhQS+H1XlEd91G6yEIIdme7PFraf
	ELuNIxqpeVmcnsXu9EoHoslnWJfOrU+OMWwtZHWp+n1qz9O0UT2GNopFNAZEeOm2Iyk=
X-Gm-Gg: ASbGncuH0ANoo0nnFaLfvDfMeYVPi7/0zqpaipN1tggWzsgVMbQu79ZGY9oZJJqpoa8
	iQPZvTFi/3a8A2eKpaBg6ji4sNiiGqwJ3pKjxiehaP29twGvoC31HU+u+E2Q5hmCJbhbpty+LAv
	Z40i2dDTL6+r6CfwPCzFCAt1HLfTBN2CqGB7Up2qt+ER3JkIygeVNeE1GadMrgJ1NovzbUYY0XF
	lReuq22SGw4WAyrvArkm4zTMgC2W/2Mo9bImvgUF+eJo6VJPwa7lQvgnxWZSQpAVpjFgRsyOxwb
	aVCfqxeWsS4kNaAPy7VNdMpobJf6U2tJllMIX4dTz/4VqMCzJIuNq3rY/Wbk/IFriQOIeUXYii4
	58tOYEsnoTMSCFIPN9bYl9KcVO2AaEcgQ51/cijW1SY6vB2ILUA==
X-Google-Smtp-Source: AGHT+IENOgSWDvrR5me5DMoY53wRwsPVCOq3Mq4OdX9AjWmXw0wgs5GSbqe1NiXMSDlX3rSsquKhHQ==
X-Received: by 2002:a05:600c:4e0f:b0:458:b6b9:6df5 with SMTP id 5b1f17b1804b1-45b81eb0a80mr30834275e9.1.1756646893387;
        Sun, 31 Aug 2025 06:28:13 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b87b3900dsm29956925e9.0.2025.08.31.06.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 06:28:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: jesper.nilsson@axis.com, mturquette@baylibre.com, sboyd@kernel.org, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, krzk@kernel.org, 
 s.nawrocki@samsung.com, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
 linus.walleij@linaro.org, tomasz.figa@gmail.com, catalin.marinas@arm.com, 
 will@kernel.org, arnd@arndb.de, Ravi Patel <ravi.patel@samsung.com>
Cc: ksk4725@coasia.com, kenkim@coasia.com, pjsin865@coasia.com, 
 gwk1013@coasia.com, hgkim05@coasia.com, mingyoungbo@coasia.com, 
 smn1196@coasia.com, pankaj.dubey@samsung.com, shradha.t@samsung.com, 
 inbaraj.e@samsung.com, swathi.ks@samsung.com, hrishikesh.d@samsung.com, 
 dj76.yang@samsung.com, hypmean.kim@samsung.com, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@axis.com, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, soc@lists.linux.dev
In-Reply-To: <20250825114436.46882-3-ravi.patel@samsung.com>
References: <20250825114436.46882-1-ravi.patel@samsung.com>
 <CGME20250825120704epcas5p37385c913027d74d221012c4ae1550c73@epcas5p3.samsung.com>
 <20250825114436.46882-3-ravi.patel@samsung.com>
Subject: Re: (subset) [PATCH v3 02/10] clk: samsung: Add clock PLL support
 for ARTPEC-8 SoC
Message-Id: <175664689125.195158.15680456692339310248.b4-ty@linaro.org>
Date: Sun, 31 Aug 2025 15:28:11 +0200
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Mon, 25 Aug 2025 17:14:28 +0530, Ravi Patel wrote:
> Add below clock PLL support for Axis ARTPEC-8 SoC platform:
> - pll_1017x: Integer PLL with mid frequency FVCO (950 to 2400 MHz)
>              This is used in ARTPEC-8 SoC for shared PLL
> 
> - pll_1031x: Integer/Fractional PLL with mid frequency FVCO
>              (600 to 1200 MHz)
>              This is used in ARTPEC-8 SoC for Audio PLL
> 
> [...]

Applied, thanks!

[02/10] clk: samsung: Add clock PLL support for ARTPEC-8 SoC
        https://git.kernel.org/krzk/linux/c/80770fccb7f60b0bc795852c154273e511f296a0

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

