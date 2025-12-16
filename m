Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B16F2D7D30
	for <soc@lists.linux.dev>; Tue, 16 Dec 2025 14:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765896017; cv=none; b=j9WMCxfGVWy14C+rNlh9ZPn1pZP4IdwOVANXMosfvp+Wqh9RPagn+8mowHx7SIUg9g2QXdBzL1ulneCYwrwDNNgq8TgbqVdqSn8fyQIfQLlUwNw5x7CioIvGEHdK1Ar18xgQhe2JF9oki44OzOsSAfaJVtS+5iAMNCzxX9cjTvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765896017; c=relaxed/simple;
	bh=c3H6TPFY1I01kqg1crGrKZrChG7ywbSiz6fMGxT/2lE=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=KCHAjZT8jZOdZyEZaeIpc9X5xqt2e4O73TyWpetIwfbR0HdtG6ws0vqyPalJCLf/BxWPIJMSVtxJiog43SMr187ize5FyiEGdCpTRw6zbYHvjjuXAjTHkEOSDBZamypLqKC7W8aCrYI5J0yssWASDmWYF28ZMjAOVdw6eDAuqg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=gE/EUmHb; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=VB+t+7yj; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="gE/EUmHb";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="VB+t+7yj"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 434F17A0179;
	Tue, 16 Dec 2025 09:40:12 -0500 (EST)
Received: from phl-imap-17 ([10.202.2.105])
  by phl-compute-04.internal (MEProxy); Tue, 16 Dec 2025 09:40:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1765896012;
	 x=1765982412; bh=ldnqBVievPPwN4paIWz2GuHWUsTTTEenwvxVDL16XSg=; b=
	gE/EUmHbO+OXO2BdF016z86Vz21blRipkOSSr4ycrxmEXrT/TGB3ChfE86veMmzX
	sIrqJc+BU0eBKB1meL+YfEtP+tSiHA5WwrZm2hnUtq2tW1jOnxQ+n2uYZ+VhFh+v
	9fQwLQixR4ijJaWqK9J/BMuqK6h76Dl4VuZXbeVPWVOLA+Iw5d+2FnO5xiVV0KvI
	leMV7AfoWE9wcKjIkJrSDMO3d4W3Sf4YGQlp8bQpsMwprFtW6OjvvUNZzCLnWYJu
	AfuI5EvmHZWV5XSDH8igiOUuNLuahspkyv47L0LepBMsXbyANI6ff2hMnGN2+elD
	O8KJ4naVmNMlQ3Dk/3yBxQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1765896012; x=
	1765982412; bh=ldnqBVievPPwN4paIWz2GuHWUsTTTEenwvxVDL16XSg=; b=V
	B+t+7yjpFwZ2csKvS8fZ1/PP/V72Z/Rw9PPDRu19VYcVqsfob+qyg8vfFhZbUT2k
	mbmO0lf7kSZrEjMVj891P9X3MYqRFGm02I+EYmwOop8My8mE7AfMAzRqyjP2+iLG
	O8i9b6yRzrXtzhdU2AsHgkrjFKda9ACHab4Wz4Wp7cg6N/At5zWhSUn3xgagZmms
	CMknZ7nAlYtD6a02WQGTu0if4XlKALkyhFs3WZMVXVnAbK0zRlPDlc5pu3iNrIdv
	KUM5WxBEbodH329EYW2KE8NUikLh0YzCGDQkOKh+BMDsPHj5oQondDiwyC1bfBOe
	MPYvj8f8GKJk7yZEvprYw==
X-ME-Sender: <xms:S29BaTITgBu11-TbY251uBEDBdnc6v5Mta2fCFbDl0DF8UDyDce7Ig>
    <xme:S29BaR_sbbCntKwxtnMtF7VXEFjGdXyAC7fDVzF-zZKfs-11nt7CHWoSNXyXImuwn
    7dNnVCRFI06Q0e143zfoXfntjuccOmsrSlP9_ZNtNx7WgBn7cIu0J8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefleelhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeehpdhmohguvgepshhmthhpohhuthdp
    rhgtphhtthhopehtohhrvhgrlhgusheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorh
    hgpdhrtghpthhtohepghgvvghrtheslhhinhhugidqmheikehkrdhorhhgpdhrtghpthht
    oheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurd
    horhhgpdhrtghpthhtohepshhotgeslhhishhtshdrlhhinhhugidruggvvhdprhgtphht
    thhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:S29Bab8dgtdIlgC9z8aGTms_TY5oWJleV_TdMh5ahJjghxMSSvxkDA>
    <xmx:S29BabaFpa7-VSxT59eZ6akRqdoBvtz_sh2wZh1f44Vrr4ILDTkXDg>
    <xmx:S29BaS3NJnO6tZ2Ec6b2YK6ygkKggXe0jTOexrWv8CUTExett-XjWg>
    <xmx:S29BaeY5RfNSIIRlx3nGhOiPcwgH0hKbQyIgoqBZ3e3PqBK-y7mNFA>
    <xmx:TG9BaQ5uP1GeIfHYAM9NejjoHNVC3tK0faMhSJym7--6tvivhxiNyDfU>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id D38D3C40054; Tue, 16 Dec 2025 09:40:11 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: AgGhHji4LWAw
Date: Tue, 16 Dec 2025 15:39:51 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Geert Uytterhoeven" <geert@linux-m68k.org>
Cc: "Linus Torvalds" <torvalds@linux-foundation.org>, soc@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Message-Id: <1ce00594-66ce-4fa7-b75a-d26dc756541e@app.fastmail.com>
In-Reply-To: 
 <CAMuHMdUKreg6NcMUK-jvgM=R1Mt=VQPntTrwN-PO-S3fnAUw2A@mail.gmail.com>
References: <334684ec-5796-47a4-b9f4-96c60f449634@app.fastmail.com>
 <52068d9c-d677-4fa6-8ced-6a7fb190a935@app.fastmail.com>
 <CAMuHMdUKreg6NcMUK-jvgM=R1Mt=VQPntTrwN-PO-S3fnAUw2A@mail.gmail.com>
Subject: Re: [GIT PULL 3/6] soc: devicetree updates for 6.19
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Dec 16, 2025, at 15:35, Geert Uytterhoeven wrote:
> On Fri, 5 Dec 2025 at 19:28, Arnd Bergmann <arnd@arndb.de> wrote:
>> Three new SoCs got added in existing arm64 chip families:
>>
>>  - Renesas R-Car X5H (R8A78000) is a new generation of automotive SoCs,
>>    based on 16 Cortex-A720 (Armv9.2) cores, which makes the the currently
>>    highest-perforance embedded SoC.
>
> Actually 32 Cortex-A720AE cores, which I believe could indeed reduce to
> 16 cores when enabling dual-core lock-step mode.
>

Sorry about that, I should have looked more closely.

      Arnd
