Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794912496;
	b=t+ZQCdbmTv+YDKyOpchleKmMgeaJuhjeMDbssHVUKgDGcjI4c+YKz+JE0DR9lDeJBLN6
	 O5JhZFUEAwY1HoUT3IMFjN0wU2YT9TrJkZbymBUdxfcHFmzczIirrBYNSmbqBvSrcmteX
	 LfcnZX3LOjQxCyrF/+mmDOe4uNeiYDfS/JB2Qfz27Cb/zi2B9yMdmFnmYYtcCd372qBpE
	 29SSMUDodEO5ax/+bqM6BisiCQyGcUKQAB9dbpBZ8WpSGMaHq3Lb78s9sQRrlKvEBWCX+
	 BCDgL24NpMBO4DijYzrHINs3TgS26a3jyBJqXkOVeWQwVKu18CLZT1OsLNURXLZkWrA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794912496;
	h=Received:Delivered-To:Received:DMARC-Filter:DKIM-Signature:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=RUN7O4VqPfmqBa2m1SYf0FMJzaRQzyuKWgap+ftrtUI=;
	b=hon33SzeqZMs8jsDiarfk//Ubck+nZuP72LoZow4BeZzPOxHJqTh0pjU0rOYjFCrIu9+
	 jg301X1iqLQBoCtzbAx5EnX0tC8mtBdkHkLiaHfd6VKNhBCEOAmv+YjrJs1ftRN08oBfd
	 PvhBh8ilk+b/DNxTxGwqiVR8JZNagfHFSZlB7LTVYxyYELnPLr65PXnPmKNBsuXah6i0y
	 a6ATkwR1kKcpiEE0wZu6TN8Jtw6rZ7I2uTFfauZDu8wePI+hWOwpY+w/2mucV0kvSLxpI
	 O7Q11Q3lAa3I7MJJIzbpEN7nF1zGkFIPJLeiw48sHYuwfSauP41eOBFtjFw/rzMsVdQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=KKdqhzGl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3F3606A338
	for <soc@lists.linux.dev>; Tue, 17 Nov 2026 10:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=KKdqhzGl
Received: by smtp.kernel.org (Postfix)
	id 1A9401F000C7; Tue, 17 Nov 2026 10:48:16 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794912496;
	b=AtQSF+VxS7vNjLa+7nhalwN4rao4oVhtJbTHEzxia+gZUDE789nHy/+/kRoD/aKuBp6M
	 +Hi2wPaXQP6A+Ig2yqJ9K2bO6sCzkmvRiQYWwQsmQOK+IeBgSE+TvyE54jDymZHvPBbYz
	 uOOUxDE5YBFXXUFdX8MTDGMNdmKUc/2O1VD0pr+Eu4tlMXESX+MTSabmNSJbc4EPVxIg6
	 6oo0146aTQOt+D8RUoYMTGEfRSn8McjMTokvFADs9fWFCwRQGBeU+AlWOGXeE2Y1kiR73
	 CRxKJE49yZ6BAAvTWV8zhZ22c7nl7huc0m2lXG1C4Nso2SUr8y0Z7e7WxtqJVBLNONA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794912496;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=RUN7O4VqPfmqBa2m1SYf0FMJzaRQzyuKWgap+ftrtUI=;
	b=S9uJ9wJMGtBUG7aGIhRGH2exZAzgVpO3dwQi+SI75k5luyKPaSO+7E0Cxi5eyCZmntmD
	 lyL4/5t+5tsiSaoNGsd/TYhJnJQMuJbSy5CH60n6caKGf23rfrp2afkie+yFLK3vBjE+V
	 oOKJaPcTYFoSjHR3pr9SAfUAR2xpLRUWcSbjRL5E7aXg+e0Z9/Tkwl8M6kNymKpxO/V/x
	 dZr2BjTbTCOJIpeVpgC+LmaJGoqC7N8bSbuJ/pJZ/btv8GCxERaYG5eMKSC4YcNwtZ0La
	 EZ0z8hEkJTEMFXiTddmdiVGhBjnJBcGsfL0AcZI/2gwY3j9nFgn+WNYK8mucB90L05A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=KKdqhzGl;
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 275101F000C9;
	Tue, 17 Nov 2026 10:48:14 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=KKdqhzGl
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 275101F000C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794912493;
	bh=orTpcthCg6xt0FFxOp+32oPMMXPRwoSXOB9hmuEtzZM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KKdqhzGl7ss26Gd1p9ybq1A4+RX5yccpkO75+8WDjf3yEi5JN2L1tN4bAtNssE8Zc
	 QQ49jh2I6rcszoPQ9PvZsjc3Akc6imyLZapzk5yyCudW8QVzjGeT9qnJBvx0I8DbCQ
	 WICUb/UBzPC50deyPUdS7Od1pRf8f8uQRsaCZGd8NBsjxoVEVx+Hyg+XB64FCZ2dW7
	 NHwsuKWtnuPZXQeOjcrNEswtLzGIKzWEMjhO7hziXiZhKNxUFy6eYfkbqAYO2DT9FW
	 KMeoNfSbg8f+1VcTZpDC+JYH05raDhMnsbnwUYEpM3U0jNbPR4K7nESzN3kCMCqeJl
	 KrL74qhD6UvDA==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 71A3517E0BCC;
	Tue, 17 Nov 2026 11:48:12 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	Coia Prant <coiaprant@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Flora Fu <flora.fu@mediatek.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	soc@kernel.org,
	Roman Vivchar <rva333@protonmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Lu <roger.lu@mediatek.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	stable@vger.kernel.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v4 0/3] soc: mediatek: pwrap: mt6572 support + log level fixes
Date: Tue, 17 Nov 2026 11:48:08 +0100
Message-ID: <179491248220.154190.177723023436695190.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261028-6572-pwrap-v4-0-1780c58d2097@protonmail.com>
References: <20261028-6572-pwrap-v4-0-1780c58d2097@protonmail.com>
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Post: <mailto:soc@lists.linux.dev>
List-Help: <mailto:soc+help@lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:soc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 28 Oct 2026 12:37:49 +0200, Roman Vivchar wrote:
> This patch series adds support for the mt6572 pwrap.
> 
> All known mt6572 devices use mt6323 PMIC, which is already supported
> by the upstream drivers. mt6572 also shares SoC-specific init with
> mt2701.
> 
> Patch 1 adds dt-bindings compatible.
> Patch 2 fixes improper log levels in the driver, improving UX when
> debugging.
> Patch 3 adds mt6572 support.
> 
> [...]

Applied to v7.4-next/soc, thanks!

[1/3] dt-bindings: soc: mediatek: pwrap: add mt6572
      commit: 44584adbef2d5786ff4e4bedef48f476a700248f
[2/3] soc: mediatek: pwrap: use correct log level
      commit: b5c4ee18cc154623cbc04dc41e3642df3b045ce5
[3/3] soc: mediatek: pwrap: add mt6572 support
      commit: 0e19a950e5c1863b3805ba3969ec661396bf1db5

Cheers,
Angelo

