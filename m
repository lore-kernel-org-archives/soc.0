Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACE344DB7F
	for <soc@lists.linux.dev>; Wed,  1 Apr 2026 16:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775061517; cv=none; b=ud7WwgNpOh5x9gq2FJXNd2J6ehLSmovHaJhkNfJu8R28wlWqSBPnBOA9Jrbwz4Ot3J4paAKDwVZsDNJR+o7g9jke+SPw8cetQG++EauduR/8g7R6pcsfATxrBcl3+sFEffnNmi6wqbjKos1BrugAFC7boGb5FxUnrRQR7H1lEfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775061517; c=relaxed/simple;
	bh=sPqWxBE/xFMh3kxmkrXxk8lE6l/D0DeQXSRoLrDJfck=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nE5HUrSQLLYxNJc88SBjeblseQrlcByPlZtdy+DycruStRZ94aIPdo8pvPRuAbpbn+84e+hXHtga6DWQn8lURkFzbvXC2eaa9p74BaHEmyhUulsisnNOSTPAv/+DCGzQy7pzZNyqND8obqbQku9ipTL95RZ3+lZvFI1KC3DyCL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CXA9KK8l; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CXA9KK8l"
Received: by smtp.kernel.org (Postfix)
	id 80522C19423; Wed,  1 Apr 2026 16:38:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30262C4CEF7;
	Wed,  1 Apr 2026 16:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775061517;
	bh=sPqWxBE/xFMh3kxmkrXxk8lE6l/D0DeQXSRoLrDJfck=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CXA9KK8lXr7LOdnV3Kjf5OiyEcYV3zjjxDHWiC5VQI9iQ6dVAK3THZEYk2lFpz5Ow
	 eEeho2HkR47wdBRRVVGtlMxJa767jFsaS64tfQQxZzdFght6o5yBzNugQwYGwpCkNE
	 o0tZyQq/gSsiV+m+AY4vaJLJaWfmi63YOgFu7oCyxeRksQZrTcoAmZfQ4TL5zpaQfx
	 Yy1kCng9wmOejMaHNmOcrE5bMATmJ0RgV2kW5r4epeSMW1XF/aFcdHePV7WrovvX/1
	 CbLfBGrWpE3U7beGlvPuju2F7ULwYIwiuY/wMRAsHYDlHsirClFFputNUf/VGXy/Mq
	 I9iwbVDuntXug==
Message-ID: <8d8925ad-22eb-4b9b-b6eb-6ae7dc3b2073@kernel.org>
Date: Wed, 1 Apr 2026 18:38:33 +0200
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL 2/2] Broadcom devicetree-arm64 changes for 7.1
To: Arnd Bergmann <arnd@arndb.de>,
 Florian Fainelli <florian.fainelli@broadcom.com>
Cc: soc@kernel.org, Rob Herring <robh@kernel.org>,
 Gregor Herburger <gregor.herburger@linutronix.de>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Stefan Wahren <wahrenst@gmx.net>, linux-arm-kernel@lists.infradead.org,
 Kevin Hilman <khilman@kernel.org>, bcm-kernel-feedback-list@broadcom.com
References: <20260323190239.1890505-1-florian.fainelli@broadcom.com>
 <20260323190239.1890505-2-florian.fainelli@broadcom.com>
 <20260401-rapid-lyrebird-of-emphasis-da7b13@quoll>
 <2e47f487-da04-411d-bf78-4c76ac793a91@kernel.org>
 <df52b2ae-4b8b-487a-bb6b-07bf021500b5@app.fastmail.com>
 <3f7879d0-9e5d-4c00-a5dc-4871a049afd0@kernel.org>
 <83a52edc-1d46-4eaf-996e-924ed3a00c83@app.fastmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <83a52edc-1d46-4eaf-996e-924ed3a00c83@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/04/2026 18:33, Arnd Bergmann wrote:
> On Wed, Apr 1, 2026, at 16:47, Krzysztof Kozlowski wrote:
>> On 01/04/2026 16:37, Arnd Bergmann wrote:
>>> $ gpg --list-sigs 9BE46ADFE60625D891F72B8587D0969C44070704
>>> pub   dsa1024/61579915B563760E 2008-09-16 [SCA] [expired: 2024-11-06]
>>
>> dsa1024 might be another answer... DSA1024 was deprecated by NIST in
>> 2013, so maybe gnugp even drops it just like keys with too weak signatures?
>>
>> But another problem is that I do not see it in the `git log` of keyring
>> at all which suggests it wasn't ever submitted.
> 
> Indeed, that also explains why the Broadcom tree is hosted on github
> rather than git.kernel.org. While using the kernel.org hosting
> is by no means a requirement, github does occasionally cause problems,

Kind of, but quoting Linus' policy - either kernel.org or properly
signed pulls by a key in the keyring.

Of course new SoCs/maintainers are exempted of that rule, but this does
not apply here.

> and I do get a bit annoyed when it takes ages to pull from that.
> 
> Florian, I don't know if there is a Broadcom specific policy that
> requires you to use the corporate github account, but if you
> are setting up a new key already, it may be a good time to
> also move the hosting.
> 
>> I don't think DSA1024 can be accepted now in keyring, so this requires a
>> new key, cross signed by the old one.

Just to clarify: not "cross signed", but simply signed by the old key.

> 
> +1
> 
>       Arnd


Best regards,
Krzysztof
