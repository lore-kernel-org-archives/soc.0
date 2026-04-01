Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C13364050
	for <soc@lists.linux.dev>; Wed,  1 Apr 2026 12:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775044967; cv=none; b=XMB0eL4+qvmM+5Kne/+wirXUmmE2raD8FX7qz3ILAzZwV/2f3E+c7pmBObqMXI6XZTjXRjqGjicjRyZ21oDHk0ClVEn8u+Mrw32x2yOxpTi79DVe3OqEt4KwtJT6bl3N5T3adGf/Go/bkN1hM4rQHbmQvzx6PAwvqGE/fSLcZX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775044967; c=relaxed/simple;
	bh=/siQRAeOvaDNSVzhc4TOJm3C/+fGkOsvtxOYVqTpsss=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=bDtZLUYgqtVwatGVvG5AJ4lVpLMmYVf8qtdu8X8kviYQ0Y73Vz7P019tbJ5ydgYSG2ypddQQzA9SFQwBGuejXIYlIqH1RPnUnfZOK8vAKe+yR89xTpWFJKB+tqmS39ghQWkOqJ4QtsdaAz7PWumVIaZKqI6CddxVza0Z5V/Os3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XFAOilF9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XFAOilF9"
Received: by smtp.kernel.org (Postfix)
	id 411D5C4AF0C; Wed,  1 Apr 2026 12:02:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F19A9C4CEF7;
	Wed,  1 Apr 2026 12:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775044967;
	bh=/siQRAeOvaDNSVzhc4TOJm3C/+fGkOsvtxOYVqTpsss=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=XFAOilF9U+0LQX/Cts12aU1aCksHUfVmS5/ApqXc0lEnc9EVufEw7NJ7Cke1a4l8C
	 aAq8tPVDJmZJHWS4FruoNDFsNpmXfnJycm/Ulwr6Ng319NnOpnnPkidHsuH67V2zTi
	 1gpSHxd9zA+T+AsL6HXhRH/ddOtIEaKPk2j4urhMBl89ulrmVia5KoHX/y3CnEI453
	 R//n9827srAnSeXTgY9nZIQU1umGoTKcnn2gNzXyF0cE1BZ11g033azQ5Bzl0tWIYs
	 9FDzKj+qlvfmTQGMT//j+oXHpOSmVovUuuy5H0XLqqrsN9Ydr7xo7QTWiKJiOYg492
	 M402h0pdkgFNQ==
Message-ID: <2e47f487-da04-411d-bf78-4c76ac793a91@kernel.org>
Date: Wed, 1 Apr 2026 14:02:43 +0200
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL 2/2] Broadcom devicetree-arm64 changes for 7.1
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: soc@kernel.org, Rob Herring <robh@kernel.org>,
 Gregor Herburger <gregor.herburger@linutronix.de>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Stefan Wahren <wahrenst@gmx.net>, linux-arm-kernel@lists.infradead.org,
 arnd@arndb.de, khilman@kernel.org, bcm-kernel-feedback-list@broadcom.com
References: <20260323190239.1890505-1-florian.fainelli@broadcom.com>
 <20260323190239.1890505-2-florian.fainelli@broadcom.com>
 <20260401-rapid-lyrebird-of-emphasis-da7b13@quoll>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20260401-rapid-lyrebird-of-emphasis-da7b13@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/04/2026 13:18, Krzysztof Kozlowski wrote:
> On Mon, Mar 23, 2026 at 12:02:39PM -0700, Florian Fainelli wrote:
>> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
>>
>>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
>>
>> are available in the Git repository at:
>>
>>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-7.1/devicetree-arm64
>>
>> for you to fetch changes up to 0acb1de2b4df426a62dba33bcd80f3939636f97b:
>>
>>   arm64: dts: broadcom: bcm2712: Move non simple-bus nodes to root level (2026-03-20 10:17:30 -0700)
> 
> Patches were good, I wanted to merge them, but then merge complained:
> 
> 	Can't check signature: No public key
> 
> I refreshed now my keyring with kernel.org and the same.
> 
> I think the same issue was last time and repo is non korg, so nothing
> seems to improve.


Maybe last time I mentioned this only internally or on IRC, so could get
lost. Please get your key in to the kernel keyring, to solve above. Pull
is not rejected, but I leave it to Arnd who might have your key.

How to get key signed? Obviously conferences are the easiest way, but
other is to find people around you or on your travel itinerary via
ksmap. Eventually many people do video call cross signing, so even
travel is not needed. I video signed twice, but that was an exception
because I prefer to meet in person. Kernel wiki has guideline on all
this, so I am not saying anything new here.

Best regards,
Krzysztof

