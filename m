Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BDC7242925;
	Sat, 14 Mar 2026 11:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773488127; cv=none; b=sftM6Db8GzLeKgyWBff3pJH9G8kAwzgbprYvcDZ0GMVKEbzJMLK1aUg7KCYHhnAMaldbEZ8FW77I5busSgBn1Ebjwe55U2z4YBTs/I8ZwaPU2l61QahdSrq+mzZqE8y2ss5jYt4FG/IY0Jx/5eOIE0uCLpl5VMeQ1UC5ad37D4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773488127; c=relaxed/simple;
	bh=GdeoLiMA8CXFq4sEcs5A46LTC+bCki0pRPFIvoquzJw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Vo0ISqVOqcpjPkJ7tYlF+wTwNHAAsocRTZnTrTBac6/ne3ihhj04vV8ENRrZzfyILlnxhd2+EgHeGb0oiZ6W3uiOcPkpRcoaq1rUcLsvqtiMsZC/v4NP23D+9Flz/crfze7hk4mi7VA35AKn50V68GDDzgv5diydj3eCOLUDges=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MKIrvyyH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MKIrvyyH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30F65C116C6;
	Sat, 14 Mar 2026 11:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773488126;
	bh=GdeoLiMA8CXFq4sEcs5A46LTC+bCki0pRPFIvoquzJw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=MKIrvyyH9CrmOreJeW6kGQPYzcwgwK9RS3SUJJy5xcGGO0PECSQF6P9P1rAo0+YTA
	 2vAk+yBNfqnu9tAtTA2nKu6HMa9OwT0Q5ljbuOWNngsNPuZnfV6Ngp1vIV3OrAejuO
	 CEXn/dy3GMPTVL0RKZ4iREOMGJffy1GQ6MsqcYfM8JzWAJEziSDsKDdQBcd5J6SBIp
	 AyLPUMtHX8Jf0KYxdS3mr+wEILNPK0pb6l3Vq0wfcX7ya744Gh5NJGXr7Y3baP1v2F
	 SqhoDbVul4Tm6EGBlaqCavnJFmzBwwzYZuXDNSrr4+qPF686A8tbVvREaJhcCmzKQ4
	 xE3wHR2FaE8xg==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linusw@kernel.org>, Nathan Chancellor <nathan@kernel.org>
Cc: Drew Fustini <fustini@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, soc@lists.linux.dev
In-Reply-To: <20260305-arm-defconfig-drop-duplicate-ti-pruss-v1-1-2839e3b42a8b@kernel.org>
References: <20260305-arm-defconfig-drop-duplicate-ti-pruss-v1-1-2839e3b42a8b@kernel.org>
Subject: Re: [PATCH] ARM: multi_v7_defconfig: Drop duplicate
 CONFIG_TI_PRUSS=m
Message-Id: <177348812490.386756.6377774746208273431.b4-ty@kernel.org>
Date: Sat, 14 Mar 2026 12:35:24 +0100
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Thu, 05 Mar 2026 15:25:18 -0700, Nathan Chancellor wrote:
> Commit ee1ab82ee032 ("ARM: defconfig: move entries") added a duplicate
> instance of CONFIG_TI_PRUSS=m, causing a Kconfig warning:
> 
>   arch/arm/configs/multi_v7_defconfig:1152:warning: override: reassigning to symbol TI_PRUSS
> 
> Drop the first instance, as the second instance added by the
> aforementioned change is where savedefconfig puts it.
> 
> [...]

Applied, thanks!

[1/1] ARM: multi_v7_defconfig: Drop duplicate CONFIG_TI_PRUSS=m
      https://git.kernel.org/soc/soc/c/9e22e9c4a5bd208a2d17f0b1a8414c170b4e5939

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

