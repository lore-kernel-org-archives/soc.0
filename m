Return-Path: <SRS0=PtqJ=NA=collabora.com=angelogioacchino.delregno@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B11BEC27C43
	for <soc@archiver.kernel.org>; Wed, 29 May 2024 12:33:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 84492C32781; Wed, 29 May 2024 12:33:36 +0000 (UTC)
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 86497C2BD10
	for <soc@kernel.org>; Wed, 29 May 2024 12:33:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 86497C2BD10
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716986013;
	bh=TtvIqDj/cbzytXl+BfyEW3QVw8j1n3TE8MYTau3IeMw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=AiSYD2DXNs8yMYs+HBIGlGChfRvsZOtVsR3myGqnAZp1gIDiHIs3fbhOe95eNqbR5
	 jEdJBqgAiIqi+eVNi3krsoukFHlO5fzImkYaBbFT/4gPRegP0kqMWskMp4/47Cgj9x
	 WGzwjLQaPazqOlAgvfHE1PBCD5U0Y7YO5VZV/9pUt3k73LFeEDlRn8HANrLb41qURo
	 z5BXDFjdQfEeCo4EK2M6IEbL3GL185BpfohtP+augqH/W99UxcfbalJb2wN8lV/DC0
	 2nFhSYu7klwd14olAN3Xbs1UkswoSz3Ye6G2bpUNIeOxbUVyUQzl+rA7L8mE+5aeo8
	 ZB6iymg6yRUrQ==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 3429E378000A;
	Wed, 29 May 2024 12:33:33 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <2fd900a30b5a0f7de4ea68f60bac250794b8cdb4.1716984213.git.geert+renesas@glider.be>
References: <2fd900a30b5a0f7de4ea68f60bac250794b8cdb4.1716984213.git.geert+renesas@glider.be>
Subject: Re: [PATCH resend v3] arm64: dts: mediatek: mt7986a: bpi-r3:
 Convert to sugar syntax
Message-Id: <171698601313.527285.15364047983482006077.b4-ty@collabora.com>
Date: Wed, 29 May 2024 14:33:33 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Wed, 29 May 2024 14:06:14 +0200, Geert Uytterhoeven wrote:
> Overlay syntactic sugar for generating target-path fragments is
> supported by the version of dtc supplied with the kernel since commit
> 50aafd60898a8b3e ("scripts/dtc: Update to upstream version
> v1.4.6-21-g84e414b0b5bc").  Hence convert the Bananapi R3 overlay
> devicetree source files to sugar syntax, improving readability.
> 
> 
> [...]

Applied to v6.10-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt7986a: bpi-r3: Convert to sugar syntax
      commit: 01738dc14a7eb3cec7c7f3c804d88a9a4e38a3e8

Cheers,
Angelo


