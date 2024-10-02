Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5701CFEC2
	for <soc@lists.linux.dev>; Wed,  2 Oct 2024 13:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727874137; cv=none; b=c03maWexmXBx4BxfqdCYyDIeecv7Y0hmvn44jUnOSQCSAyc3zElRZqiJO/dFCvW/byqo2Zh4CcecyzESV11tNQLPeOws/CYZW27K/q9fOHeROdB4RKnfmcrt7EykgeKlEQwn5WabyLHLfSq6/TEgLg+SiDpoF6yfFEYJmokuyGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727874137; c=relaxed/simple;
	bh=V6+ZpVKOYtob9yUnS+bSJltLOmlfDPMLjeiE2IeEK+E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O7mVxyxDqu8OO9t1D4VG1M2iCJqhEssiqJ/luj13RyqoGHovHgiMy9KQRvWh1oZ5kFOx/FM3Vj3H/FBq600rknxsvla3jojstXrFlIep7O0kTveAOlzbYbSpCh0YKAOGvMXo1RdCMYDhMa8HcLk2vAIUlU4zwGM/P0O4dydF0pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XvqrsfBg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XvqrsfBg"
Received: by smtp.kernel.org (Postfix)
	id 51CD0C4CED2; Wed,  2 Oct 2024 13:02:17 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 34900C4CEC5
	for <soc@kernel.org>; Wed,  2 Oct 2024 13:02:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 34900C4CEC5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2fad0f66d49so46554031fa.3
        for <soc@kernel.org>; Wed, 02 Oct 2024 06:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727874134; x=1728478934; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V6+ZpVKOYtob9yUnS+bSJltLOmlfDPMLjeiE2IeEK+E=;
        b=XvqrsfBgWc/fObm848hegQfYXUN9tn33BcVOoeLP8I0mNPPOmf5uhLzzzNehsGpIJT
         qiFgXyynXyEq+N+/ZLOVNaPsi5g9u84TPBa1wtInrQpHH3oJppl+7RRSq9mTe2ZXgyoE
         GajWYC3XLsLCPQ9DqnAhWO1zha0RmD1pJANmO+pkPjLw96pzTDVbGdTWsbhtD4Gp39A6
         GvRBlYT3DCCuLxgDgBIOviOaHC+nUG9C2hxQ4nmaSTa1BiBmZKC0DhHZkcHrvllDAOF0
         pCp7R+kjtanPcxUs/YQkjtVTXZ0NLenpWAa2KhMXqRa444BMVeQrjyjooq5D4nqkxmj1
         3VUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727874134; x=1728478934;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V6+ZpVKOYtob9yUnS+bSJltLOmlfDPMLjeiE2IeEK+E=;
        b=IYA7o/BZBxK02d4dsSvOBN+mlSiOiwn8RZk5HuLHooGS3O12iywQvFMJUe08TCH0sK
         1vr/7cf2SSVKUNMkl4iNkI23+nr31eqUIRt65vBWbf3uiimG1WsPeXZHrY6kFvgMl6UM
         AEf6PzD4ooPkwbPVhYmdeI9DQD8PpJa3w8x1W+YwuAEAXuzjkUsFdRfNCk9Vykbtgixt
         m5HtDqlQVu8RftlbTHyhXQaVnouYYC74GJTzCEEzIh7ZGWiFA+Z7YdZCQaH6prXbqZT6
         7PGio4fwNWZ/S4a17c3bu+4CACFnpyAuy6B0de2BvW0BJKyUk0SEDrHlGR+XEYNFQ09v
         iOpg==
X-Forwarded-Encrypted: i=1; AJvYcCWLQlxBAg/VcD6KCUJ/y3GE0xDRH151B+ctmrzX9+/xLSwPbXYTf/jjSj/qqQE2Y27x8jk=@kernel.org
X-Gm-Message-State: AOJu0YwnCrVefarFCHYLmJKJSQx3uRNRfh7WGlYg2xwZ+kGBN9+9K02Y
	T15iZAmZ6Wapz7HJgFoY6cUEM7033o/aQ3iHRb1OYqmBB2slLaizooNjZ/mUXQHKLlaD0fjEsCt
	tmgm8Ons3JqwAkhLt4w60eMkmQHjPPFltRAofSQ==
X-Google-Smtp-Source: AGHT+IE17VRzgHlUxgYGy7U0/MRfvq2+ZgvbaqzRxZ67LxJlM2/ueQxV3YOwhvf1FBPYjEvmw9ciY4+lbofbyCL4t5Y=
X-Received: by 2002:a2e:d02:0:b0:2fa:e0c4:f08b with SMTP id
 38308e7fff4ca-2fae109c4b1mr15001981fa.36.1727874133833; Wed, 02 Oct 2024
 06:02:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240925095635.30452-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240925095635.30452-1-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 2 Oct 2024 15:02:02 +0200
Message-ID: <CACRpkdYLvt-fz2zxEwTeahGkR_iLQzioQTGwUuMc52=E33HnQQ@mail.gmail.com>
Subject: Re: [PATCH v2] Documentation/process: maintainer-soc: clarify
 submitting patches
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, soc@kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, linux-arm-kernel@lists.infradead.org, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Will Deacon <will@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Conor Dooley <conor@kernel.org>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 25, 2024 at 11:56=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Patches for SoCs are expected to be picked up by SoC submaintainers.
> The main SoC maintainers should be addressed only in few cases.
>
> Rewrite the section about maintainer handling to document above
> expectation.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Conor Dooley <conor@kernel.org>
> Cc: Heiko St=C3=BCbner <heiko@sntech.de>

Very nice and to the point document.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
