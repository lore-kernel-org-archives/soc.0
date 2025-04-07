Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD1F1FBE88
	for <soc@lists.linux.dev>; Mon,  7 Apr 2025 15:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744041410; cv=none; b=FbKzyQYqhb+gyt6LcmJz/UWhFljyP4jXk5yKteu4VKVS4hPJgeosb59+4tMzutDTYPW2efHteZLCrA9FSKdYMwVwlnEAEWqWTZnp5LsxWggpgJ4RuGQwycX+/lRWMeSgtN5zXFlBaCtThfDrMNLKetTMxBRuG3tW2TYgBgCbcls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744041410; c=relaxed/simple;
	bh=lB60eOJuf5tOWXfPKUzsxGfJef4dFGup2NjoNJe7wnM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jGs2I7BqgeFKGMWFIqzBSAfoQh5lS1xevzzfTm+jgovsI+2bBfYXBI6B7JdfBGw502gwpovleG0k6B0Vd2tqZCtC6yjraTrUXjMMNwI179nW9sEgYyiVcOQlonXNEvkMVG6JqjsJlhMDSw5D4urfal0A4OBaFK0G+xhCrBIpBRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uh5uiJLM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uh5uiJLM"
Received: by smtp.kernel.org (Postfix)
	id 6FECDC4CEED; Mon,  7 Apr 2025 15:56:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59493C4CEE9;
	Mon,  7 Apr 2025 15:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744041410;
	bh=lB60eOJuf5tOWXfPKUzsxGfJef4dFGup2NjoNJe7wnM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Uh5uiJLM2GbJZh2empkgAoW7OP6kChL6dFWFY7ekUSlkXXjH/HNgLOaHvwXV+Y2vz
	 ZQ0WYyMFRITXJeVajWbn8NQrleMF6L2lu6svbF6TujpSvc8Xv2GSsmSN4hDJ1eYZzB
	 l8pLiPOZL5dLdRjxw8kb9JuL8mzyiwr3tX86QnCDuGo4L7PsbOKlIJSMylX4EPIt6V
	 7Q2ipTIQJxrwPp/Kc5herELmX9RlDXBEq2ammPU+n4F+g9bwSELzteAJBDCh369ZHn
	 nOFnK27gpbD4/1VNl0UOqVYUt0iRJpEJWU0FUiJI3j74luu1G0LAndJH5oa7JZUoAR
	 NrEpQ1ePUmF6Q==
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ac3b12e8518so844892266b.0;
        Mon, 07 Apr 2025 08:56:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXfzkFzQS76j04Q21Tjow4jbt2DmisAAra0yY/WbjoW1tTIJQP89vGTbXRSGqqpakKgWbU=@kernel.org
X-Gm-Message-State: AOJu0YzMHUXsWnLsuZrNyuNyxGX/OLqUQkN+85wBPrGdha88wb8k0RRD
	WcPNrsx6CzGq0LxwcEHYRqHtcODdSxtx/xh2SDPpwvAf1yYisTq5hP2itoJ+1ES6gPphsVS10Sn
	1TjpUORpK/0EjCE0lCxs1Z2Lg5w==
X-Google-Smtp-Source: AGHT+IEwypuQHtewe7oLHDK0Lin7VVDrmqaMnF/yfoZXK0Vm9Z2Mu4r1UfY0Dvl+rcyWlqG0RDs93c4ecVbGJ/eFp/s=
X-Received: by 2002:a17:907:7e88:b0:ac6:bf3d:bf45 with SMTP id
 a640c23a62f3a-ac7d19671efmr1333301966b.36.1744041408915; Mon, 07 Apr 2025
 08:56:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <5552256.Sb9uPGUboI@phil>
In-Reply-To: <5552256.Sb9uPGUboI@phil>
From: Rob Herring <robh@kernel.org>
Date: Mon, 7 Apr 2025 10:56:37 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJo+9ycUFHVZ2Darh_RWaRuJGX6KKQGsbeuDWav7vKA2g@mail.gmail.com>
X-Gm-Features: ATxdqUFJPngLMLFKdy7L4W0Pm0-UEMG8nDV-9UTClAhrHanA2WHbpGaiUSuF7Mg
Message-ID: <CAL_JsqJo+9ycUFHVZ2Darh_RWaRuJGX6KKQGsbeuDWav7vKA2g@mail.gmail.com>
Subject: Re: [GIT PULL] Rockchip dts64 changes for 6.15 #3
To: Heiko Stuebner <heiko@sntech.de>
Cc: arm@kernel.org, soc@kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 19, 2025 at 6:56=E2=80=AFPM Heiko Stuebner <heiko@sntech.de> wr=
ote:
>
> Hi soc maintainers,
>
> I made an error and accidentially applied a patch that was meant for
> the mfd tree. Thankfully Stephen noticed that when the duplicate
> commit appeared in linux-next.

Both commits are in v6.15-rc1 now and the revert is not, so this
should not get applied/pulled. Or you will need to revert the revert.

Rob

>
>
> Please pull.
> Thanks
> Heiko
>
>
> The following changes since commit 73d246b4402c3356f6b3d13665de3a51eea7b5=
55:
>
>   arm64: dts: rockchip: remove ethm0_clk0_25m_out from Sige5 gmac0 (2025-=
03-15 15:49:00 +0100)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git =
tags/v6.15-rockchip-dts64-3
>
> for you to fetch changes up to cee24bc73d4f3f47344a1a54100a69c72f1db061:
>
>   Revert "dt-bindings: mfd: syscon: Add rk3528 QoS register compatible" (=
2025-03-19 00:22:18 +0100)
>
> ----------------------------------------------------------------
> Revert of one commit that was applied accidentially and should instead
> go through the MFD tree. It is already part of that tree as
> commit 7f3e3e7228bb ("dt-bindings: mfd: syscon: Add rk3528 QoS register
> compatible").
>
> ----------------------------------------------------------------
> Heiko Stuebner (1):
>       Revert "dt-bindings: mfd: syscon: Add rk3528 QoS register compatibl=
e"
>
>  Documentation/devicetree/bindings/mfd/syscon.yaml | 2 --
>  1 file changed, 2 deletions(-)
>
>
>
>
