Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA32E2E8B64
	for <soc@lists.linux.dev>; Tue,  4 Aug 2026 05:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785820406; cv=none; b=Y6/P9TH9aUxnagDhRw7WUdvVonTH+OKQV42is/RlYMX7gLC+2bBvFlYV71mT2A1nL9+VMq7Gnin4nRczuPR1jiSZc5smx6RF+kKP1dCHIUub4FUn//S9o0+VnLTk/v3f0dnXMPLeDWmrCTh0wD2junCsrKydK+ttfvlrN5o3P68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785820406; c=relaxed/simple;
	bh=0zyImKWqChWg64BRinKUqCmM80XKHS+TQ7R7MDBDEAI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aFallTpBwLGPH2c3AXwb6BAK9yKY9A3MQz6CXW4Bkni4cDZ9E7affooTehjHu3ULTqAUMeZDf0KRNUhUDCa68XB00f9HwIAs8uXDXKGbbUs/h5mP352pooC1P56SvoV7CvNAYgiX97zOAXm7zikvASie3vt+NDjVzvRWSkQxktg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=SeuVWyW6; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="SeuVWyW6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1785820401;
	bh=0zyImKWqChWg64BRinKUqCmM80XKHS+TQ7R7MDBDEAI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=SeuVWyW63EDw3w3sBXJnGaJfGnsyqrG5HcucHOA94P/95jxP5Gma+01cwpWXoLENe
	 3mebM61BstbCtSWm0p163Fs5AjN4op67t0lx+GAJQ1qXmiI8kCOIAtW7tPb1C+5jAq
	 F2UfaTLzpgkl/NFQstxsnDYawHBYRt8I+vto8tM2vvFRWvszh5RGNFd8lP0Pzphog5
	 6fUxwsUuCVE8Ej69zbaLUm/x/k13v70yaYQSnFVr6YWYCTlHoZELCizxMCF/pV5qz3
	 3k8AZQ+NZzWwxN1HXHuIDm/CUqpLPguwm44OXpPklXlBQmICIArEVd0A7efgyOl8ch
	 IYszW99+2LG/Q==
Received: from [192.168.68.117] (unknown [180.150.113.112])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id B20A6655A9;
	Tue,  4 Aug 2026 13:13:19 +0800 (AWST)
Message-ID: <6da6d2fa5111e479aeefd62da70974601acccb96.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 RESEND] arm64: dts: nuvoton: ma35d1: add CAN nodes
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Jacky Huang <ychuang570808@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
 Zi-Yu Chen <zychennvt@gmail.com>
Cc: soc@lists.linux.dev, Jacky Huang <ychuang3@nuvoton.com>,
 schung@nuvoton.com,  Rob Herring <robh@kernel.org>, krzk+dt@kernel.org,
 Conor Dooley <conor+dt@kernel.org>, 	linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org
Date: Tue, 04 Aug 2026 14:43:19 +0930
In-Reply-To: <825a3a1b-8891-4172-afd6-8de6077fa129@gmail.com>
References: <20260708082457.460710-1-zychennvt@gmail.com>
	 <5f2954e4-2e0c-40d0-b67f-933446c83cc1@app.fastmail.com>
	 <825a3a1b-8891-4172-afd6-8de6077fa129@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi all,

On Mon, 2026-07-13 at 10:57 +0800, Jacky Huang wrote:
> Hi Arnd,
>=20
> Thanks for the clarification.
>=20
> Shan-Chun and I are still maintaining the MA35 platform.
>=20
> I have reviewed this patch and it looks good to me.
>=20
> Reviewed-by: Jacky Huang <ychuang3@nuvoton.com>
>=20
> We agree that the current maintenance path for MA35 could be clearer.
> We will work on making the MA35 maintenance flow more transparent.

I discussed this with Jacky off-list. Going forward I'll take MA35
patches with R-b tags from Jacky and Zi-Yu through the BMC tree to keep
things simple.

I'll pick up v2 for the next merge window if there are no other issues
with it.

Andrew
