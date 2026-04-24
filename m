Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3050535DA4F
	for <soc@lists.linux.dev>; Fri, 24 Apr 2026 06:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777013562; cv=none; b=OMLVznefJ0jJaF1ejWBC51UYgUu4Tsbc159ppcpWT4PsjcDpdBm5YuiNHn0VKJ5ERVuwR3PrSUp/f0RKDeY1IBL2ZLDqfyNv8ve1y9OsjImbJEahlySV2HowcqsYitIY0JBTw0NknruZheRproI3sZRA1Yc3+VmEMKOUqR4sdlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777013562; c=relaxed/simple;
	bh=eYGqWREJ9t2uBPSuLp01WOMw7hclrmXIq4dVcWaYOUM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QKW87712DXwuLvV0eLjU5Wu1MXWJzYcraKmmqt9iBhYLVdHBlb/okTYtMJsbb3CoDu77ADA+8RHLN3XyM8m/DHQOiMVjTXwKnnnd+y9Vxc2oyc4IXr9Ac4nDt+A/jKlnmkp1sTxCNTEipLO25EpbpHkLxSUPu5Eh0R5p6cIQ8pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l51U5Cxg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l51U5Cxg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8D2AC4AF09
	for <soc@lists.linux.dev>; Fri, 24 Apr 2026 06:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777013561;
	bh=eYGqWREJ9t2uBPSuLp01WOMw7hclrmXIq4dVcWaYOUM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=l51U5Cxg/vsN99RvDm0swBS6cNz8W2DkpGFQdHlG98i7myVRHACjAxnBomWXubZC9
	 3kZj4HBIhtnxjv7FNZyn3FVF6aYrwgC05i9JmGg3j7F5cYA3OK3jOnzhuITGUo7qrs
	 G99oYkl1a9t7FlpYRSLLfNS4HPeX9T0fyKA0iI0ZataeH/JzIPVqIyw+wHYNxWZicZ
	 3WjSiri9FfbnNY0zr+QqfA9yU6HNTzrXOyDQenjaP7fA407kFCurcJ0zWNmZ54Kg/f
	 zFJSTm1wjJAUxi9hkHxwiw9LMlsc8VXFGe2tdQBQyIiiXvWbfk5hVaD+Rc3ikmDRTo
	 pxWlWAIXLcl3A==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-38df1889fb9so72408991fa.1
        for <soc@lists.linux.dev>; Thu, 23 Apr 2026 23:52:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ93IT6fJXScwP9FksS6sQEUaKZwDrJPIUkuZP8Svagg8cgFD4rKZmvFQkRq4x5vi5Kis+Y=@lists.linux.dev
X-Gm-Message-State: AOJu0YxA2mhxwW1dyL2rLMFyBfo08D4QcGgnP4lTEydr40HAl8WSNV1P
	Cw5klEwHIyIOx3SOyy5/R+FjXd0lX4FgmkXUCykxB+wNDVMwW/Ey31dUMxixYY7PYs5sh2I7e93
	LEmHXSA9+gClB99fC31MswQkm+E/8qX4=
X-Received: by 2002:a05:6512:39c7:b0:5a2:a703:969 with SMTP id
 2adb3069b0e04-5a4172f61e8mr11627099e87.40.1777013560689; Thu, 23 Apr 2026
 23:52:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260412-defconfig-v1-0-a46918286451@oss.qualcomm.com> <20260412-defconfig-v1-2-a46918286451@oss.qualcomm.com>
In-Reply-To: <20260412-defconfig-v1-2-a46918286451@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 24 Apr 2026 08:52:29 +0200
X-Gmail-Original-Message-ID: <CAD++jL=khLykkE=VRbA-heYnstB3-qKbVQQZuwKWwLoN8h7UDg@mail.gmail.com>
X-Gm-Features: AQROBzAVcbkI_sms908bxwemfiJGkmoXEu80hkmvEUQdT6yrUO-GqXxxnDOIaCs
Message-ID: <CAD++jL=khLykkE=VRbA-heYnstB3-qKbVQQZuwKWwLoN8h7UDg@mail.gmail.com>
Subject: Re: [PATCH 2/6] arm64: defconfig: Drop unused legacy netfilter options
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Drew Fustini <fustini@kernel.org>, soc@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 12, 2026 at 6:21=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> Drop all options which are ineffective now, because they depend on
> disabled IP_NF_IPTABLES_LEGACY or IP6_NF_IPTABLES_LEGACY.  No impact on
> include/generated/autoconf.h.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
