Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795608856;
	b=vnvQx3PRw2yBazfV1XZGLKminMY1bIo9S6ghqXt8LhJdpiK54t4J6KLCarEQFXBVJ/6Q
	 B8aQX8uMf+NlbKQRwFrSjLfzMBA9MY058TEyLlJ9SAcF7Yrmxnn1EyZJ9jZlNqWIm0aMO
	 kEgBAOLx67jydEDzMAXSRT+HBWQLvAp1r4YZG8r75wDiIh9XZDBL8bBHd0d++8PhJigIi
	 qbMqkdfvrT9onRV8DyHn8eH+Gn2svOsdcrJyqv8jVd4Stv8ihg11AA4jmYvSAMtxgo1m0
	 qGhjTSlwrt/sLCUfpDhDEpMYhis4EgGY0wnyx0skQ1zBE+NzMozvenjQwTS23t/gSyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795608856;
	h=Received:Delivered-To:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=Iy0LBKjBroedimxVaC/1j6YmBtkw1EAVLklYNel3/zk=;
	b=gBceklsFkckLh1wCQdDM8RmdIuoFW47V/oAQ22BejAJLEz7Dk8SeMko62otMMRK/T2tw
	 nOB4Ldo9WPsOfHehvSnCAR58wS38rjBhCcpS1byXXXS4RKsZ4FaQYgO6lEort3lBWaMtM
	 YcULVWlQ4HTyoPCSPmM4bxatIr2ifnhz9/7QAcWdZrbaQ9rS40xS2Sj/oRWAtmvKJABz/
	 WjmsGfE77nrSGwedOeNHo8oYD5tUBZGx3MpqBMN+d7OxoQ48KBrYP5Wu20zR50LKpisKm
	 FCqRZ4VWjqhiBNsFybmXinmJCa7pmCXGtT58waMiK9pa+y0zKCbbJjqF9nDKia6/QeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TzJ+HvHD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964B5606A31E
	for <soc@lists.linux.dev>; Wed, 25 Nov 2026 12:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TzJ+HvHD
Received: by smtp.kernel.org (Postfix)
	id 7ED221F000C0; Wed, 25 Nov 2026 12:14:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8E6B1F000D1;
	Wed, 25 Nov 2026 12:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795608856;
	bh=Iy0LBKjBroedimxVaC/1j6YmBtkw1EAVLklYNel3/zk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TzJ+HvHDB4WuioPqlB6xngB+hDQFIIitX/b4JQpeXskjO2YuLPvZrheYYoZqXFFYX
	 8/eo2bAhcpD9Y/jNmWjPT1WyJbFmcMHAscdSuO+FF8ahtJoik/Mnwd6C8AeDyD7I1y
	 bmBSOBIkLUrYa/UXuwz0NsN8KkiyurAjLRoMdg+bs9XwzUZ/z9NXSlxwa7s12IRd1q
	 XUIpN+JFxQNoLlA+H7NC5giIw0QQGBYDyFd2Mkvf0DkURAjU8ilELWDc/EpMHYaNmF
	 x+nf+IWrj2QncJKbFn9B6kHRarPQhgpu0rGEa5bQyuEKGevxrKpy4Y2CSCjvO9zthc
	 oDQ7DS/njv8Pw==
Date: Wed, 25 Nov 2026 13:14:13 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: arm@kernel.org, soc@kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] Rockchip dts64 changes for 7.5 #1
Message-ID: <20261125-practical-stalwart-ammonite-e24832@quoll>
References: <0mz4dc8hQSOr4_mBKfnwog@sntech.de>
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Post: <mailto:soc@lists.linux.dev>
List-Help: <mailto:soc+help@lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:soc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0mz4dc8hQSOr4_mBKfnwog@sntech.de>

On Sun, Nov 22, 2026 at 03:02:59PM +0100, Heiko Stuebner wrote:
> Hi soc maintainers,
> 
> please find below a first bunch of Rockchip dt changes for arm64
> for the next merge window.
> 
> Nothing really stands out.
> 
> Please pull.
> 
> Thanks
> Heiko
> 
> 
> The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:
> 
>   Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v7.5-rockchip-dts64-1
> 
> for you to fetch changes up to 30eb5fd93649928b9e4149d24fa182c8521fdc20:
> 
>   arm64: dts: rockchip: Enable all CPU OPPs on Kobol Helios64 (2026-11-13 21:35:29 +0100)

Thanks, applied

Best regards,
Krzysztof

