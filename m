Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9961B422F
	for <soc@lists.linux.dev>; Wed,  8 Jan 2025 08:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736324034; cv=none; b=bX7CYg7CXcCegSQ7IVtLCYYEn6DJk7Yz0cTRWXBlSjMoGLdbTGEWa2Ut6BQf9gGNsbp36ptyroYLDYcYZ8wxy7Sl2aXA7zrsD7vXFVsJlkh8VVUmCvHEMYQIzMvV+fG+NgYLZwmCb5V5LvjZeRahN6woZGx0piyDb/FtmFAHMiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736324034; c=relaxed/simple;
	bh=eFQd/rOrwfACzWCNzl9L4achewwuEGmKo2NPSzI/j8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gts9IopDPQF7TNB8b5UOcSWKZ5kxSE7w1Zj7fB1+5ueLUkK2EiC3VfGqNQP60x7/df5HV5cupYt04dUNozACogmWt3skYKG3UX7HM6wqouOV3KnNDz7y3PlhhSVC1t2I8GGImjF+Z/PhywbwSgCOckxKT0t817n6iEE68PD9reM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=0o4c7CYm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="0o4c7CYm"
Received: by smtp.kernel.org (Postfix)
	id EDC09C4CEE3; Wed,  8 Jan 2025 08:13:53 +0000 (UTC)
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C81B5C4CEE0
	for <soc@kernel.org>; Wed,  8 Jan 2025 08:13:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C81B5C4CEE0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=IbL/krlMll3S2kVTqYaIRGP9u2Lqdwfdc2KndPTPmZE=; b=0o4c7CYmBj3lHwVgJ2P5zHQ3Qy
	dX+OT5s0v9fVVgsB1vrGlLJcHqMmNvU53lr/X5Cxvq4ClNs6VNQE+bRuy32KudSks9fctsVjBtARO
	kn9pGX9Cbd5x9zzaRMfIdgT3b2Kp+jDxmN5pgjiTinNeX8sx1Lky4Ab0rS4rrbeHPuG41zMHLVZz7
	kMrsNgR26P53ZnID33AkcTSXZMols9PxOyAzGvt+bMlPqy6g8GEmj5KfJvQ2L+elw5KJRfaEOIqb0
	2QQ0zPPS5D8I02PetCF2c40ruTCP/boYib5l3FmVTBKvhn9tv3+XYqwebmIuW1mMywUwe3n4WDlOq
	jIj6UXFw==;
Date: Wed, 8 Jan 2025 09:13:48 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Kevin Hilman <khilman@baylibre.com>
Cc: soc@kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] arm/omap: drivers: updates for v6.14
Message-ID: <20250108091348.46f71e35@akair>
In-Reply-To: <7hcygyb3yi.fsf@baylibre.com>
References: <7hcygyb3yi.fsf@baylibre.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Tue, 07 Jan 2025 15:26:45 -0800
schrieb Kevin Hilman <khilman@baylibre.com>:

> The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:
> 
>   Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.14/drivers-signed
> 
> for you to fetch changes up to 6ef4ea3c944b9fc5d78317d1172cdcd10f9724f1:
> 
>   Input: tsc2007 - accept standard properties (2024-12-10 16:17:30 -0800)
> 
> ----------------------------------------------------------------
> arm/omap: drivers: updates for v6.14
> 
> ----------------------------------------------------------------
> Andreas Kemnade (1):
>       Input: tsc2007 - accept standard properties
> 
>  drivers/input/touchscreen/tsc2007.h      | 2 ++
>  drivers/input/touchscreen/tsc2007_core.c | 5 ++---
>  2 files changed, 4 insertions(+), 3 deletions(-)
> 
This is input, the only reason that is goes via soc to keep that
togother with
ARM: dts: ti/omap: omap3-gta04: use proper touchscreen properties

So shouln't it go via your dt branch?

Regards,
Andreas

