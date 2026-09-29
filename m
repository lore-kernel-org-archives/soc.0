Received: from mail-ed2-f32.google.com (mail-ed2-f32.google.com [74.125.228.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31514D6C3F
	for <soc@lists.linux.dev>; Tue, 29 Sep 2026 08:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790672222; cv=pass; b=AiXzFk10IQJj+aOtsUNzvm/G8qEZdo8M823LVipiugUmE4M9cVmU7pXB4627W5BGkX3SDHUDHAsPaii4FGbTmHAifL+3RZFkflbm8QMnWoGbb1s/k4CV+CLnQuD0iayvJVOouhhXS4HiH50b6OgOd+vmqLzRzKyOxQ3T4vCssLY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790672222; c=relaxed/simple;
	bh=bTzNqAl7bOHEFXynD4y2LmlWSn2p5vLqLneAHc7FfuA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NvuvKeIDl/8miTKaIeByorjJ/7UmEX3U7nIGmN/hev4yC4Pc0yX0VOxwffizXj6a51z7qG6tL0Th1dI7EZrJ+jd2c8AP8t8/mF0tf+xrVmPgFhh1dYOT7w2WIDPjktuzpuT1NBRmWYebyKkaJUJEqnYosPeUtoX1+NgcgB9GIqI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cU0q+5lR; arc=pass smtp.client-ip=74.125.228.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cU0q+5lR"
Received: by mail-ed2-f32.google.com with SMTP id 4fb4d7f45d1cf-6acb6b726b5so544161a12.0
        for <soc@lists.linux.dev>; Tue, 29 Sep 2026 01:56:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790672218; cv=none;
        d=google.com; s=arc-20260327;
        b=Sfam8YukQNZnK8zrNKC7lrvNnCYVtqJzPrMUV5DTY0pj8mOfpryCYhdWcsoqwSJxtO
         9s4OiGLE6bMnV3orltG5tBhb7kVlIraUu1qAeRml710TUJGJCjJcKrp2et3MuT2do8FF
         I/PdNHVtuDlZL0CIPi030ZgzMpGsGb2xvzTnh2AfxgcF4nfuHA1Ku23Ue30bdF9/lYGE
         sYg9jfQYXTKgo87cwSqwGC3M/Z/l2X7XoRAmnEaCxpY7Ydf+osuq2ZwLyDTYmIk4wedj
         iUoGmTYBunA3uHBB4K3+0SJsY02a1tjFFs7fGQMNnUW3aj1rHRBYEKFfQlwMoaoRU0Jh
         uVEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bTzNqAl7bOHEFXynD4y2LmlWSn2p5vLqLneAHc7FfuA=;
        fh=xKEe9X3xa8yya+ipFuVmBcu53e/cwsL7gOH3zOwjnrA=;
        b=FTpq2xjBsR2nNPujnRHXBFamcBdeVCGyNw0CEdpTzRkCYnJ+162UAiy5Uv4cgDTxiO
         LlOBhF5YcxpxXrEepQqbonhW+zO7r7WZ85cRN9Xm8BkB61vc1rUgtQabUyCf8bLEDzCl
         ArboXzPQAVQGL+HIu7kRPJ0myQgPnkLj02ALEPP4YJLTFf8TCSP8+k/febRQ5vb/XeND
         CuSNuVoqEN83duFKH/vWuxW7rdrqcRa0IlgKRwq6UquFM4ed744/SjQf+BYSiTEZHc/K
         5pexaZrxAkc+RXK9xhHP9BOv73nXtNxoQUtJJZmger2CE4faVOBfYUK+4mJ9/k3NGTtu
         /iug==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790672218; x=1791277018; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bTzNqAl7bOHEFXynD4y2LmlWSn2p5vLqLneAHc7FfuA=;
        b=cU0q+5lRZ2vdag8L8KbECBMguqdbss5sdwaZMcKNnpRZFGrII5P2To353eTiPh33Dp
         3HkguIZoVY8LDLmVLUVWzKsCxDEwoQ9CVZtPAoQZ39jQRuH4BnDFkBpp1WHZmf7ojU6F
         V6+LU7DNKrmyDph1FHYGSKYNlMTUk7td/SwZ2Z58M5MnLLpGmkniobjJz9iXRBxV/Bi7
         1tWScyunzXJAafool9zsHvzQxTHFjxUxp1CmWxlAjhPNX1yM7mtGpnxzmdLITcbf2Qso
         nl+4aApMZ9OBr2Qhk33mI1dT721L8WDzW0COaKKg/S4uIUnrXAOWSBQ5HivC0B+3Cwjr
         LTng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790672218; x=1791277018;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bTzNqAl7bOHEFXynD4y2LmlWSn2p5vLqLneAHc7FfuA=;
        b=mSzPZYSk5nJhAzON5UazYYXJMhaR/RkTkLLlmILaUi82d86j40GWE+vx861PMoHmXt
         dQqBcu5bsf24AE/9M2qGvN24IndyMAoViy5RHIIa+5uBfMz1vi35U7hnbyiNgAGGmz7I
         PYZb9EwHTeu7+fdXC8xEATDhBxGMMNW7V7deUetiTxWytjooOfAZ8sGY93kl/BsACi6U
         0kTzvPWHncCsalaOB4cnNd6/MHE+IxL4SCsiJvDh5k8ohAhJW1lKFhHR4lc/Xn5mVIX/
         QlXseEDK6EW0qxBfCZpJVwFtiqhnnte48H/n3tnK1NdHXcBm+nR6u3JZ4pZHB/C7qsY0
         ztNw==
X-Forwarded-Encrypted: i=1; AKwUvBxVklHWWOg8bwMvoYljgQUK27clcZKwwlnWNgzSByWh4BBVvxWzsa38v4OySKKyZhNkWbk=@lists.linux.dev
X-Gm-Message-State: AFq9FYIXEaoZXxsTkU+mdspgFHSIGocdrLHL9m1u3BrQZDzH1xNEzlC3
	8huMy8fioqow5C7Fv5Uim1NdolpQMEEsZs4kF8iCzQPbDRKSSxA+fR/dhdUjcwyDr/u7GfPt1sm
	GjQWhMzu2IVEFR5UXdhiYEqo1Ioj0PrpT86cwj+aoWA==
X-Gm-Gg: AYBFou14tJD2rTWqGG2Q9DKsKfxVU2uyIa5JTSqb4c7p4zMgxzzdw0UfRuNftk0kbZn
	/9VF+tUCTmSHNFD7oADAUtzsZmp5AcYUoCYa/5D/YoKQK5DzjmU+gUkDCcj1lDX+PXqEbM5YaYg
	jE6jnJlnyuWnFGgHW9E0ukmV6MLogtqScS4eAkZrnz2hyw2N39mK8JYhKxmyxRRcbsjSgVV23CR
	QbTNAS0qn5p8nBkmp5ittIedLS1PZjFuLR9R04IdY330dQn3/LZvUE+Rd5CcPaPfIK1MPqFOB7I
	Gaa8aiZa5jzu5d308RsGXOoSHcMCye8GjE/m2o7TMiSTOaKK1O8KbiOdtIV50i/Uj+ecZc0BNwE
	zLa5wJysnH/Zz
X-Received: by 2002:a05:6402:1951:b0:6aa:f14f:556f with SMTP id
 4fb4d7f45d1cf-6aaf14f5874mr8695635a12.43.1790672217943; Tue, 29 Sep 2026
 01:56:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260918-contrib-pg-pixel10-initial-dts-v4-0-745eaca28b1a@linaro.org>
 <20260918-contrib-pg-pixel10-initial-dts-v4-3-745eaca28b1a@linaro.org> <7553dff6-004a-46a7-88c2-728651366113@kernel.org>
In-Reply-To: <7553dff6-004a-46a7-88c2-728651366113@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 29 Sep 2026 09:56:46 +0100
X-Gm-Features: AclHuK-S5lTQAo2phJ3ee1A6qOipGEmCVgzdBHBpPtrnraavkUJzNtrZ-i9YXbY
Message-ID: <CADrjBPrUr4+oa2jFJw8PkFbO__Ov91Do7A-h8xp3zdePGQcMKg@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] arm64: dts: google: Add initial dts for frankel/blazer/mustang
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij <linusw@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev, 
	Douglas Anderson <dianders@chromium.org>, Juan Yescas <jyescas@google.com>, 
	RD Babiera <rdbabiera@google.com>, Brian Norris <briannorris@google.com>, 
	William McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-serial@vger.kernel.org, Brian Norris <briannorris@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Hi Krzystof,

On Sun, 20 Sept 2026 at 16:16, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 18/09/2026 21:05, Peter Griffin wrote:
> > From: Douglas Anderson <dianders@chromium.org>
> >
> > Add initial device trees for frankel (Pixel 10), blazer (Pixel 10
> > Pro) and mustang (Pixel 10 Pro XL). These device trees are enough to
> > boot to a serial prompt using an initramfs.
> >
> > Currently only Laguna B0 silicon found in mass production phones is
> > officially supported. Further revisions such as A0 silicon and EVT
> > devices maybe added in the future if they are useful. As of today,
> > these device trees boot fine on EVT devices with A0 silicon.
> >
> > A few things can be noted about these device trees:
>
>
> I actually forgot if you intend me to pick it up. I assume it's not for
> me to pick up, but nevertheless let me know if something is needed from me.

Thanks Krzysztof. If you could take this via your tree for this cycle
that would be much appreciated. I will then look to set up my own SoC
tree moving forward.

Thanks,

Peter
