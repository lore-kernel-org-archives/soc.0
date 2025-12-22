Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD10310785
	for <soc@lists.linux.dev>; Mon, 22 Dec 2025 10:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766397958; cv=none; b=OI7lPInIAabQC7JtPoeGLDM5lQsr9QX6b7D2mGBSln4d8CncxP51v5UbOBEulpS9/TkE5ePAhKAlj8NoJGYhzxHAtuvkE7fJG+974nU7GHMu+Q6bFyrcPRGrm2ENzHJhxkNW/Okl9QaGoPQit95wE+BGyqhA4qD116lJthWE9Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766397958; c=relaxed/simple;
	bh=dbCeQR0Saz2zf9gRRuGfxyz8HeBfBxMGo8jsnHFm4cM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JiCyAIbeT8KwreagxP7MP0w4xu6JReQKpgavGTn6KMtf4R+rIsudW0RGqOFA76BfVT0+Ah3R3gHI4s2pInzqPPhrJkNHHQPv8dYM2RGuW5Yobnc2hivFIr4jdb72E/KQpsUQ/cnaf2C5NXgYl0zlolNMEVeTmjQci/RsJNnfqzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KRcyJ7De; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KRcyJ7De"
Received: by smtp.kernel.org (Postfix)
	id C7557C116D0; Mon, 22 Dec 2025 10:05:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59A1FC4CEF1;
	Mon, 22 Dec 2025 10:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766397957;
	bh=dbCeQR0Saz2zf9gRRuGfxyz8HeBfBxMGo8jsnHFm4cM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KRcyJ7De+MoInnifH+n7nDBBy0rqKgFlmPozycx123tqqG3PnoaZUW42SDK8Mx25f
	 cNUn5zjbKI7lxewlx4yeS9Edi2wLFwiBht3VMUSyrdSp06GU/DuFRLhJbiAvAplS0Q
	 TAjt4cuiJsjXCWZ05/J/OS2N3+pWTS97Ya+pr5TWbaVLjmqFUFAnMT8Gn2pjid8qj4
	 HxK1n3mY5pxc3J/xQCfC9tCisl0E3SAbDUVTV/7fogCfsQ93l1mQCXsTvR+YC25mjW
	 +6mr/dBbwGg8myn2AFWShUM8Ve44PDJB3foSy3dCF1dgqYaAkJS0A3PstWhUx7B8K1
	 Cvg4/dIuJKglg==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: soc@kernel.org, Khuong Dinh <khuong@os.amperecomputing.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251216-dt-apm-v1-0-0bf2bf8b982c@kernel.org>
References: <20251216-dt-apm-v1-0-0bf2bf8b982c@kernel.org>
Subject: Re: [PATCH 0/4] arm64: dts: apm: Fix remaining warnings
Message-Id: <176639795496.32569.2551367419659973704.b4-ty@kernel.org>
Date: Mon, 22 Dec 2025 11:05:54 +0100
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Tue, 16 Dec 2025 14:27:47 -0600, Rob Herring (Arm) wrote:
> This series (along with separately sent binding changes) fixes the
> remaining DT warnings for APM platforms with the exception the
> non-standard use of the "phy-handle" property having 2 phys. I'm not
> sure what is the right fix there. It looks like the same phy is defined
> twice on different MDIO buses though the "apm,xgene-mdio-rgmii" MDIO
> registers overlap with the "apm,xgene-enet" registers which also defines
> a MDIO bus...
> 
> [...]

Applied, thanks!

[1/4] arm64: dts: apm/shadowcat: More clock clean-ups
      https://git.kernel.org/krzk/linux-dt/c/21bd5fb461eb485768cef99e0ff531a6b84b67d8
[2/4] arm64: dts: apm: Use recommended i2c node names
      https://git.kernel.org/krzk/linux-dt/c/cae405d73986579a88bfb956f1ae9b514c23a7bc
[3/4] arm64: dts: apm: Add "reg" to "syscon-reboot" and "syscon-poweroff"
      https://git.kernel.org/krzk/linux-dt/c/a1176f7c5b990244e9a0ee2bdd93c9a36e5fe666
[4/4] arm64: dts: apm: Drop "dma" device_type
      https://git.kernel.org/krzk/linux-dt/c/5cd532f7f017460395836d8f129ad3ee5ae63110

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

