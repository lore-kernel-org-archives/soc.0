Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5682380
	for <soc@lists.linux.dev>; Thu, 22 May 2025 00:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747872457; cv=none; b=AOYF2TjaINy+oeBAhBFccN1eVc+ipAywD1Jj2gpOjY4x8hnbhSFy4cFy14RTPgN4Q4kTiPk9oDWo1vsxVmTlUPohKZRmbXuWjTcsmAEsBy2BwzQMT9f7NRXrOWiH/bjRNWcXOc3mkXkoFV8WcWgPbowsceb393UcRgtxc40bHG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747872457; c=relaxed/simple;
	bh=Urv1jVwu0Q+E6mq7JBYvmi5pB1W10/UJg3jW5vNhIgA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Me9KddZoV5ZRlLWDVdyNzj2TGdgxYDKeDiByeH3j8Y/eta66qGjiuKydTOSuRf7vxGtEBy4sI6IjwPcphwBRJt2hVrGzFEp6dtVjnRsBeCPieKygg20Qt+7yTNm8u4Si1TaH15vESFi9sohyN+4uvh6Ew9oSLJypqkZwHh8koHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=D4ntc4p0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="D4ntc4p0"
Received: by smtp.kernel.org (Postfix)
	id 4B309C4CEEA; Thu, 22 May 2025 00:07:37 +0000 (UTC)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 36848C4CEE4
	for <soc@kernel.org>; Thu, 22 May 2025 00:07:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 36848C4CEE4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1747872452;
	bh=Urv1jVwu0Q+E6mq7JBYvmi5pB1W10/UJg3jW5vNhIgA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=D4ntc4p0iPYy62pMDbcfdpJP7DRbM7aSUoCFKtgyf85o3N5pePDuDQIE2LcFXtWUn
	 91UD5dDIPzEHK8VPxFZaDD4bBI2a+a/gv+wT0GAlHQVRYdMEy1K5t2sVlRUZ2EQ06V
	 Wl2nxde0RLMHE6QOIp2uLH14Vb+dYXMLsNUCfpKzFDuER3Z2UTZocOxxE0CYH1sWQI
	 yUTARzcssLuSvU4mo0YHZWRCcLjJ6Yb8HSS29nggpfEl7QWMZCfiWpHD43u6697C5A
	 Wx3D/t6/S6m6dz9rH8DFzmF4YkZr4PxV+/LCpnEcgFQS5l4BAL0yZxpLg+NpWxrg8F
	 RYjyQoytWoRgA==
Received: from [192.168.68.112] (unknown [180.150.112.166])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 3E8C3640CD;
	Thu, 22 May 2025 08:07:30 +0800 (AWST)
Message-ID: <0219b4977bc21faa75b539de2fc8f123f2ada048.camel@codeconstruct.com.au>
Subject: Re: [PATCH 0/3] soc: aspeed: Minor fixes for v6.16
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Arnd Bergmann <arnd@arndb.de>, soc@kernel.org
Cc: Joel Stanley <joel@jms.id.au>
Date: Thu, 22 May 2025 09:37:26 +0930
In-Reply-To: <971e4c0d-5b8d-46a8-9803-6d221573bcdf@app.fastmail.com>
References: 
	<20250515-aspeed-drivers-6-16-v1-0-eb467f6b7a7c@codeconstruct.com.au>
	 <971e4c0d-5b8d-46a8-9803-6d221573bcdf@app.fastmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi Arnd,

On Wed, 2025-05-21 at 23:08 +0200, Arnd Bergmann wrote:
> On Thu, May 15, 2025, at 08:30, Andrew Jeffery wrote:
> > Hello SoC maintainers,
> >=20
> > This is a small series of small ASPEED SoC driver fixes for v6.16 that =
I
> > didn't think warranted a PR, however let us know if you'd rather a PR
> > instead.
> >=20
> > They've had exposure in next via Joel's for-next branch and have
> > otherwise been around for some time.
> >=20
> > Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
>=20
> Hi Andrew,
>=20
> Patches are fine here, the main difference is whether you think
> it makes sense to summarize the series in a tag description, as
> that content is lost otherwise.

Ack.

>=20
> However, please always remember to
> Cc:linux-arm-kernel@lists.infradead.org. I have set b4 to
> pick up the patches from there, to ensure that everything
> I merge is also visible in the lakml archives.

Ah, no dramas. I've made a note for myself for the future.

>=20
> Since all three patches are simple enough, I've applied them
> manually.

Thanks!

Andrew
