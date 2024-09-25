Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021A114B950
	for <soc@lists.linux.dev>; Wed, 25 Sep 2024 07:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727249657; cv=none; b=VeVO6FT0T9ZtXY66/Hp0wWTT7nhp0xbkHFWy5QIE9/vSeZNRjXDhJoPb3UJ0s9oePpLZDjqRI1zh1E87YkJd7ofoTwxieikBQh0hAxywR6bMJtVDeZUqLVUDiC7T5iLr+YhHtQpQUsNauPIwjAo/wOCasatZMnYArLljlVpREis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727249657; c=relaxed/simple;
	bh=isFwFaRTFKj16YSv9nhDGr6kCwogz7fMPgWT9GbIAac=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PVYagVlhrH5j2wBjWxOMCz0RahUPaUdqGD5C6dftAwK/AE+vmF+XQDjxkvXKQI+BSulseo/qMXOIoOR2LDbh/QFk+4kMj7Bob3STjdGTpli7ViLdh8NjyyVyxxtUE94ujoRiX7NLuOJnbsi6+uSCE5hax/hcGLapXpxsCkl3Z9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=njCSsye+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="njCSsye+"
Received: by smtp.kernel.org (Postfix)
	id A0288C4CEC3; Wed, 25 Sep 2024 07:34:16 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9F657C4CEC6
	for <soc@kernel.org>; Wed, 25 Sep 2024 07:34:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9F657C4CEC6
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-42cb8dac900so62728615e9.3
        for <soc@kernel.org>; Wed, 25 Sep 2024 00:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1727249653; x=1727854453; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n8evR+3sFy/NMuSZynjpwriRL4R87o5mqb1UEgxBo7Q=;
        b=njCSsye+Z4yDylqUwvdnrm56PXoPX1O999dfUNN61WXKUVw1iaY4gVoRP+tEtXlUXT
         amztDkmtP4ZNtD2xUSQSmBbPJXA5uFVkymAZ95EKLEdhedN4mHi3LV66W6tCHgr6ErRj
         WCsuDaL6Jj63ykYkhUE3oi3/T0KQcBml9cGQ3i+GscaCEJeGaKcFZENY6fwzGgloqJFX
         1gHIjgu9le5QxztIikGJEq9a1bQs2sAi6TXsGAQAjZvS18NTgnKHSBxS+QPps76llpH8
         lOP/3VD6EdOHKTbydK/3QXdhZK6FXJa40gWw+drIBJuR4SLNGlJv3qnSSzQGRe3MHZ2n
         5MgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727249653; x=1727854453;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n8evR+3sFy/NMuSZynjpwriRL4R87o5mqb1UEgxBo7Q=;
        b=NEiOBIGYdX11g96l5h1NsjoOuXFPctmU95KkzIT0LjHjz1r5aRNf2E593sOBfYk5G2
         ycDgh0NRMIqkj/IB+2DMF56Nts4Xxwx6cPdP4FwY3QOrKisB2UBxhJ8/733Ro+P7YBSm
         oadcCWpiRzVEzwxczlx0Fc6OUOI6M+F6CgNdUxB7euEt6zapPbwYb+Cz5lnBURO2cpWq
         c7VWB/n4FgdOZ/94j0q+5verPe6efhsKL2hNZjXh/m7Ol+WjUX5P3NTsUl1b/wz4AbSs
         bJYn51Tj5tbTu4+NS/KtMUkwk2T1C1oihOVriuuheFdrg6NBVOgGcOXP3vkrLHYcmNJh
         Y+1g==
X-Forwarded-Encrypted: i=1; AJvYcCUPfewGPrB7KExuEKJxF77cPqMzSkVIzgNzhN+fzA6cRIe7dCV3nkFP4a1QzRsIxAzfT74=@kernel.org
X-Gm-Message-State: AOJu0YyvkdVB3Q1RbC0hpo4zHY0QSgHmtxdKwaZ/S6rqIfxRkLYFF75N
	Z2HcVU0Mh2Gd7W+YbvXavur8UoN6lWOpi50l36b6kz9xydWBMmy4qii20T9+CLE=
X-Google-Smtp-Source: AGHT+IF02GPx8xRrQ7QHLnv6LSOWPvwNOG7tn+YhUooj0p7JLAW1CQ4VB97iDTrVE3o+2k/r3fIJKw==
X-Received: by 2002:a5d:5d86:0:b0:37c:c51b:8d9b with SMTP id ffacd0b85a97d-37cc51b8e5emr496665f8f.40.1727249652399;
        Wed, 25 Sep 2024 00:34:12 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.115])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e96a17d30sm9671075e9.40.2024.09.25.00.34.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Sep 2024 00:34:12 -0700 (PDT)
Message-ID: <70f1981a-5956-4abb-afd2-4321f4b21e8b@tuxon.dev>
Date: Wed, 25 Sep 2024 10:34:10 +0300
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: microchip soc maintainance change proposal
Content-Language: en-US
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Conor Dooley <conor@kernel.org>,
 Daire McNamara <daire.mcnamara@microchip.com>, soc@kernel.org
References: <20240924-overtime-entourage-bcf3d6ff8c80@spud>
 <6d6ab21d-44fa-491c-98f7-8a2d8ab86c62@microchip.com>
 <202409241424582a8b426d@mail.local>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <202409241424582a8b426d@mail.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 24.09.2024 17:24, Alexandre Belloni wrote:
> On 24/09/2024 16:05:45+0200, Nicolas Ferre wrote:
>> On 24/09/2024 at 13:46, Conor Dooley wrote:
>>> Hey folks,
>>>
>>> I mentioned this to Arnd and Alexandre at LPC, and to Nicolas before
>>> that, but I would like to propose some changes to how the Microchip soc
>>> support is maintained - mostly affecting the riscv side of things that
>>> I've been maintaining in my personal tree, alongside other platforms.
>>> I'd like to propose moving those from my tree, into the at91 tree.
>>
>> I don't know if the "at91" naming will remain a right designation of what
>> we're doing in the future, but well, let's stick to it for now.
>> Some find it a little too much tight to the old Atmel brand...
>>
> 
> We could take this opportunity to rename the tree microchip or mchp. 

+1

> 
>>> While the dts bits for the arm and riscv platforms have no overlap
>>> and nothing is particularly gained from me moving which tree
>>> location they're in, I'm far more interested in disambiguating the tree
>>> that soc and/or firmware bindings and drivers end up in.
>>>
>>> I was going to add the bindings/soc/microchip directory to the
>>> maintainers entry I have for drivers/soc/microchip, but while doing
>>> that, I noticed that there have been recent patches for sam and sparx5
>>
>> FYI: and we have the older drivers/soc/atmel directory (which is caught by
>> "ARM/Microchip (AT91) SoC support" entry).
>>
>>> bits that have added files to that bindings directory that went via at91
>>> and I figure it's almost certain that there'll be drivers added before
>>> too long. Having a single location, like we do at the moment for clocks,
>>> would make the route upstream for things a bit clearer - and I figured
>>> that while moving one thing, might as well move the firmware and dts
>>> stuff too.
>>>
>>> My assumption is that the riscv dts bits would retain their own branch,
>>> and that I'd still send the PRs for them and for the firmware stuff given
>>> that there's no !riscv soc content in that directory yet - and I don't
>>> want to saddle Claudiu with more work for devices he probably doesn't
>>> care about...
>>>
>>> Seem reasonable?
>>
>> That's fine with me Conor. It makes a lot of sense as we're working on more
>> and more topics together.
> 
> Looks good to me.

Looks good to me, too.

> 
