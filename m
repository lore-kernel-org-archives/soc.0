Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D30B2EA749
	for <soc@lists.linux.dev>; Fri, 21 Nov 2025 08:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763712607; cv=none; b=rWfDyPqVF3oHeKDqqeYXX85tXb7yn1/nwNXHQkFtSVPm+980TTINHAmJaKc1suhPW39HVYKEYxbmv6jJ1Sgrnx3hGWiomdFFzg0CylY8X1sn5YQhwidoTnck0WStCceuNsFfBynqi74AAzzSRJw3qs9hPPTg2jQtGWO1Mnmn+GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763712607; c=relaxed/simple;
	bh=9ox/Rz6M/Duube33w05U9UwkFIMovXlrMiY8Ws2MCk8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jzSi1pnUuHu7y23K8Pby/iBtaxSu1DDpRF2EkvsFSsclnVUkfV/XA1APmcxwljqztUeIEnA8rBKg38yuNeLZdBqoAT7//42ItzZ6pW76C2Urk2azyqS+JBVP7Ph71uExYGaQoJUcSAMd3SyhWHf4d7leLA1XVyi4X2KdrO4Tqog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qJ9fok5O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qJ9fok5O"
Received: by smtp.kernel.org (Postfix)
	id 406EFC113D0; Fri, 21 Nov 2025 08:10:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FF40C4CEF1;
	Fri, 21 Nov 2025 08:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763712607;
	bh=9ox/Rz6M/Duube33w05U9UwkFIMovXlrMiY8Ws2MCk8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qJ9fok5O8OlwVzNOnXO/nty7Fb3SrdKfkpz3Gp/mRDZa8Vk5EOj1CthVCWDWvpnqV
	 VVYYCObFMX70+gi+wlRui2l5EVaYcx7yyhWWMrIX2/PiE4x+efidDOSHvyOwXxdZKD
	 BlII9a/VbROgEPUcaSSrnG9rXcdupJnlnpuoAH31tdQmTq6XknsJckcCy4tXiS8ZxY
	 Z4qTjz28ncOeRLvHixmxsmySpwHACI/ZTEi5S9bBuA/7wiKerYkSF9Le7y1ZpJnjjF
	 F0yLcU7j6naNH6ZWTBMwyNBUt+ZUfAtj5Dwnvir4TtifqbNGlsf9CqTMjS+hgxI1y1
	 HXHS5XQg2deyQ==
Message-ID: <c55c87ea-01a1-4200-8fed-e629d7d068ec@kernel.org>
Date: Fri, 21 Nov 2025 09:10:04 +0100
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: make TPS6594 support build-in
To: Michael Walle <mwalle@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: soc@kernel.org, linux-kernel@vger.kernel.org
References: <20251120075656.2396371-1-mwalle@kernel.org>
 <0d6e055a-d71b-443f-83c8-6365a88ad9b6@kernel.org>
 <DEE7CKFYFS69.2R2RADO7WNTFS@kernel.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <DEE7CKFYFS69.2R2RADO7WNTFS@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/11/2025 08:42, Michael Walle wrote:
> On Thu Nov 20, 2025 at 2:51 PM CET, Krzysztof Kozlowski wrote:
>> On 20/11/2025 08:55, Michael Walle wrote:
>>> The Kontron SMARC-sAM67 module needs the TPS6594 regulator driver to
>>> boot from SD card, i.e. for its root filesystem.
>>>
>>> Signed-off-by: Michael Walle <mwalle@kernel.org>
>>> ---
>>> Arnd, the PR from TI [1] (which contains the device trees for this
>>> board) is already out, so I'm sending this to the soc ML directly. 
>>> Let me know if this can still be applied, if not, I'll have to wait
>>> for the next window.
>>>
>>
>> Why it cannot go via TI tree? It should...
> 
> As explained above it can of course, but I've missed the time window
> as the PR from the TI tree to the soc tree was already sent out.

This alone would justify for anyone to send directly to soc@ when they
miss their upstream maintainer timeframes, so sorry, but that's the way.
Time window in TI can still take it. If they cannot, then for sure soc@
cannot, because soc@ takes from TI.

Best regards,
Krzysztof
