Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0634B67F
	for <soc@lists.linux.dev>; Mon, 19 May 2025 18:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747678260; cv=none; b=GuSQdL+E0ijWWAn6ahYBY+vKtq4JcVAhvbevQCFdgIOdXeivP7jyCiqa2N4lO2bPw0STG9FVtPeN8ihkLIx3PgYuXj/bz/FDChuLjpcihHo5eW3P40vruLuqTeXVyhVjr/GJS45sIbz2VHsUcEP28mWgPDVrMhFo2vQTNhPi64U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747678260; c=relaxed/simple;
	bh=Ky0fmrfwge+IY4bSNOH9mQDS8ka4IUPbsfw3eKleRxk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EiEC7xEWQaZOMc9Kt6imbYbLYFj9wdN3zYQvcTAJdW4zlWOo+bdYvem+XVs1DZbnpIxrQ4Dba+DW2t88KKxOm8cyfB3Fw0KdYmAIZGwuK28lYneEp5cu33uOWiW+NJFDlRwHPCjrXTXH0kRokqT4ZGH54z/2RVKTxtWXSIp2zSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kd5pJ6ye; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kd5pJ6ye"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1DFCC4CEE4;
	Mon, 19 May 2025 18:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747678260;
	bh=Ky0fmrfwge+IY4bSNOH9mQDS8ka4IUPbsfw3eKleRxk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Kd5pJ6yelJj3HiptDntqzlSkkzCz4Ly3ITUxCG5bMXaERsrxgVRrZC38BM8fdFfLr
	 uFJq+ofiXiDkFkts6enro4IFFEGz+aj7cEtZUORRgS4yAif5q0bcUdM1FsepI4nELr
	 uEtWofpfKOGvJwcd9aG/kTCtOsOpTySXQqK4K9eaSWUg+O/bG+Nq2FvZp9wyYEfZYV
	 pG6Hjz3hlfH4d4PzUTTrr0eYPI2i6+/RB9uMsvQNizZ1gDOg78Lv7VLTUUQUWoY/Vs
	 feF3MEXIE+Aw8/QpMsrVDUvp/fBPhJoUH7kV78h6IJap9ygK0KICxsqKMkieX7VIxt
	 EJY2oCsaGPHMA==
Message-ID: <b35b5145-ce7f-464d-aba7-c5f9021836de@kernel.org>
Date: Mon, 19 May 2025 20:10:57 +0200
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Add ARM64 defconfig to its section
To: Fabio Estevam <festevam@gmail.com>
Cc: arnd@arndb.de, soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Fabio Estevam <festevam@denx.de>
References: <20250516183035.685914-1-festevam@gmail.com>
 <175cdb8a-4fcb-4492-8d64-e59896b2448f@kernel.org>
 <2c72c0a3-6b30-4525-b27f-6627f6a078c2@kernel.org>
 <CAOMZO5CZvjrXV3k3hHWCWo2CRsOvR7Epw+RW8=Q=Y1qjGctVmg@mail.gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzk@kernel.org>
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <CAOMZO5CZvjrXV3k3hHWCWo2CRsOvR7Epw+RW8=Q=Y1qjGctVmg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19/05/2025 20:06, Fabio Estevam wrote:
> On Mon, May 19, 2025 at 2:37 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> 
>> P.S. We have it explicitly documented in maintainer-soc profile, so with
>> this change probably you need to update that document (with its own
>> rationale).
> 
> The reason I submitted this change was that Arnd asked me to resend a
> patch that touched arm64 defconfig with soc@lists.linux.dev on Cc:
> 
> https://lore.kernel.org/linux-arm-kernel/ece2df8d-acaa-4554-8c82-24ed45f3a8a4@app.fastmail.com/


Yeah, I understand, I saw it, but that was an exception. One of the very
few cases of defconfig not belonging to vendor SoC maintainer... and
even not originating from such subsystem (Ard's patch).

Best regards,
Krzysztof
