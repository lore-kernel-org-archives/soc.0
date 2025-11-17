Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9368B274B23
	for <soc@lists.linux.dev>; Mon, 17 Nov 2025 22:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763418121; cv=none; b=fdti+biMHa1ElmtPDur1QYoom4Hs6apEBzPzu+E054bT6GTmYnj73gYfTXm36JwnhKP4pQ1KXTkdvpg38evESbdn5AJJPH5o9pcdBP5r3cuz+HyiSstDLrY0JfBdrGch8up7hvGjOGh/KvUT6EAOmKkrlK003SJBq59BsNsKrLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763418121; c=relaxed/simple;
	bh=c+waW+Yhc3LwRMhvVQvqG5Db91OeMZqGS4iIqLC2Bug=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F12mhSGXoP9Trs1PfJYodpKl1sPRqvYZbgwJ2a3vCt/AIs3MrN078wRUExICbS+cI1QjExpbw60qbynlZ1pNJYtr4NAkNIQfG/M8MikDUDMwi7r0fNxCaSyeqXDLz52rhmb0yaTacsogvRJquY4WM0jKRzb01dHsUisfJUAmN9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=tk6NOali; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="tk6NOali"
Received: by smtp.kernel.org (Postfix)
	id 03468C19423; Mon, 17 Nov 2025 22:22:01 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D6E19C116B1;
	Mon, 17 Nov 2025 22:21:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D6E19C116B1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=MgLSx7e64sWUF9mZjgijgEncCA3Ifjs0gQT6anRu8Go=; b=tk6NOalizXnAmyQ7QCnKbfCYVl
	yD8blSj86GmwPEJJ+W2g5TMggFbNvs9xpzRpEFkd4ttqZ6GJbstDzxWnPayyYyEtpW3ArUWpW1qKg
	F3xiXxC8Q+cNyjJTVGm+uz8BgXdlcH/3sbF+prPJsjEJ/xv+/UEb2eqkbUYO9ei9gNYiMNTEyXBFE
	X2CEQHxRY8XqBv9/D/NTnzE8TK0K/h3it4jEtpya16JSr3m4kL4KTDsdttvu24XxJ714KuQR23Rq9
	YxTGZjRIF2m2J0xwaGqp0QosSjyD6TbsDtjO2RdXZ4LOMYJdKakw2zJOBL+qEVvNrf0plWccFiunX
	eEf43V3g==;
Received: from [31.12.4.86] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vL7bb-0001Qb-8j; Mon, 17 Nov 2025 23:21:51 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] Rockchip defconfig64 changes for 6.18 #1
Date: Mon, 17 Nov 2025 23:21:50 +0100
Message-ID: <2738363.Lt9SDvczpP@phil>
In-Reply-To: <2101096.usQuhbGJ8B@phil>
References: <2101096.usQuhbGJ8B@phil>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Montag, 17. November 2025, 23:19:30 Mitteleurop=C3=A4ische Normalzeit sc=
hrieb Heiko Stuebner:
> The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df567=
87:

This is meant for 6.19 ... I messed up the subject with the wrong release.

Sorry about that
Heiko


>=20
>   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git =
tags/v6.19-rockchip-defconfig64-1
>=20
> for you to fetch changes up to 60705b039f960378bb2a0a844f9378646bc0c6c8:
>=20
>   arm64: defconfig: enable rockchip camera interface (2025-11-16 00:34:27=
 +0100)
>=20
> ----------------------------------------------------------------
> Rockchip support for basic camera interface (CIF) and Synopsis DW-DP
> driver, as well as the CEC extension to the DW-HDMI-QP driver.
>=20
> ----------------------------------------------------------------
> Andy Yan (1):
>       arm64: defconfig: Enable Rockchip extensions for Synopsys DW DP
>=20
> Cristian Ciocaltea (1):
>       arm64: defconfig: Enable DW HDMI QP CEC support
>=20
> Michael Riesch (1):
>       arm64: defconfig: enable rockchip camera interface
>=20
>  arch/arm64/configs/defconfig | 3 +++
>  1 file changed, 3 insertions(+)
>=20




