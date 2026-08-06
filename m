Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C638742BC30
	for <soc@lists.linux.dev>; Thu,  6 Aug 2026 22:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786054090; cv=none; b=pjtKCZG+gn7gQiHOHzUHS++DPMKkJemvNj/ZAB3M719DHtaj6OIhUM2cxh7qs2Hz9JynUWmg0A1jyKdliBIPpWSiX7ZAH0uQvTGtXUtGrsExQbZcQ1IRN3l3q6cgzgMCTq3p6JROpOG0l/brLYhJFTvFF3eYdZTcHkOp7b/rpkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786054090; c=relaxed/simple;
	bh=Q7N4xLlBIWxo81ItawG5CepKXwZzHPZ98raJQApwEes=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rkpe94cyIlP1qsf5bKK4UYu+cFa9AL/VaZpfavlUDFsmf8f0KY52Y+8emwzNjfYrweU4dUf80CifcQKSp7sMa4xqNRLnR0wm0Rl/p1ri1J5IvqVGZgWFziMw0DgRpiiZLvQFJkD2AMG+Bnpy9mXtrB7i4wu611lHZP7qjRG4eu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KcKv+8od; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KcKv+8od"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8256C1F00A3A
	for <soc@lists.linux.dev>; Thu,  6 Aug 2026 22:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786054088;
	bh=Q7N4xLlBIWxo81ItawG5CepKXwZzHPZ98raJQApwEes=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=KcKv+8odgHShJ6+IAS80kIFlyDUrtN9j0njxElbmeCbO9xzZ6eaElKjXhoMz/fu9p
	 pF1eHN4DVmoTeJ+ypwjPIrQqJvrPWvcKTz9E3tyZINV6GqNslh0DhqEPKdXsHDHYgR
	 uPrWi845D2nnNFIyfy1LLVXOJb24HMRNEvI1Qt9oxugEF62wz6kQBRECcTJ9+Nd+gu
	 RucfsEV+usXt/FPndR6yHDheq0/G4l8HSY7rGYnl+WNp4LekBncPVsI/9e4d9EgOnd
	 UtNibRIPgm/wwoF5n9Pwu8MImaVLBMHztrFAZF8PfDLEwkTkmW0p7t1gTzHtjn5i5D
	 tkKuMuTjyPhUA==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5b01cb18515so2640386e87.2
        for <soc@lists.linux.dev>; Thu, 06 Aug 2026 15:08:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrHqr+vqfLKV/DUsgWHnR+DEeIGI81YkRA7fqFntU6Jl36Cyxm9q40XyrmsZCqrYLNskuc=@lists.linux.dev
X-Gm-Message-State: AOJu0YyM4ir0w534oElFrsmdP7SG7eLayHvFvI+WlUrQU7URcpP9J3fg
	4Dq1dQiQIt3KphH3b/smer4et4PviKRYYNmMbOqlpoar1ICHxtS6skA+S4gM4nt4IFs5kO0c+nX
	dna9R7MCo5qm36L6SsOPr4ROEY8bgOUQ=
X-Received: by 2002:a05:6512:3e1f:b0:5ae:c5f0:ef1a with SMTP id
 2adb3069b0e04-5b2f4cdc18dmr2664985e87.50.1786054087347; Thu, 06 Aug 2026
 15:08:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260803091740.232536-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260803091740.232536-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 7 Aug 2026 00:07:55 +0200
X-Gmail-Original-Message-ID: <CAD++jL=i5LW-EcbWYqAN65KEKZQsCi6NgcKwiLGm04trfXL9zw@mail.gmail.com>
X-Gm-Features: AUfX_mw8VVtdH_lZi-qOKtX4NutJWCkxj4cbQuE8TCFpBmYysjfroCHFXaMc5U4
Message-ID: <CAD++jL=i5LW-EcbWYqAN65KEKZQsCi6NgcKwiLGm04trfXL9zw@mail.gmail.com>
Subject: Re: [PATCH] Documentation/process: maintainer-soc: Mention
 expectation about dt-check-style
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Drew Fustini <fustini@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 3, 2026 at 11:17=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> Any new DTS code should pass dt-check-style 'relaxed' mode without
> warnings and should have addressed most of applicable 'strict' mode
> ones.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Makes sense!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
