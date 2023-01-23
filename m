Return-Path: <krzk@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A08C25B50
	for <soc@archiver.kernel.org>; Mon, 23 Jan 2023 10:47:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5720EC4339C; Mon, 23 Jan 2023 10:47:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB5A4C433D2;
	Mon, 23 Jan 2023 10:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674470820;
	bh=0xX33Nfx5rL8d9f+YVny+RjAkFIuJTO0MUo7c5zukZw=;
	h=Date:Subject:To:List-Id:Cc:References:From:In-Reply-To:From;
	b=qF2UxNsZZayF+VSKLzapeXg4cQ4DSag2MXIpEJWOjxcXSJtf54/hM3845FBAK5VMv
	 AnCMGaqImaQM/adBy0kSQiWGpEoArfWBmf1Q3kZjTO8N5rPRqNoNxdEcX+MEz9Rxo/
	 aMPxv0NaMnW/XM3o1c1yDSEDowWtHmDWSScxn15wkVg7KmKhBpjggGH7wutN9+hhEW
	 L3RQlwM+fwMiO5C2dBVLKxYrgmpw01RC4cIQBt76N3JNBY2nHQSlAlFhNIF8mMckxC
	 h/tF3MkMKtUfawCfkfx9YdRZFKeecd/r5aBwwunxLMhiKAJZm3Cihj10tdynhtN/nK
	 t2rHDTf5roDJg==
Message-ID: <082ab65b-09d3-e899-ef46-7fe04446109f@kernel.org>
Date: Mon, 23 Jan 2023 11:46:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [GIT PULL] memory: drivers for v6.3
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
 arm@kernel.org, soc@kernel.org, linux-kernel@vger.kernel.org,
 JaimeLiao <jaimeliao.tw@gmail.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <20230122121129.28699-1-krzysztof.kozlowski@linaro.org>
 <CAMuHMdXdZbJDTOzQG4=pRpR1OCU0=RTDZDH0MnPW8Ea2LJKs6A@mail.gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <CAMuHMdXdZbJDTOzQG4=pRpR1OCU0=RTDZDH0MnPW8Ea2LJKs6A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/01/2023 11:43, Geert Uytterhoeven wrote:
> Hi Krzysztof,
> 
> On Sun, Jan 22, 2023 at 1:14 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>> The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:
>>
>>   Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)
>>
>> are available in the Git repository at:
>>
>>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-6.3
>>
>> for you to fetch changes up to 4fd1a0e496cb81e939c55143fc81c2be130099c4:
>>
>>   Merge branch 'for-v6.3/renesas-rpc-if' into mem-ctrl-next (2023-01-22 13:05:21 +0100)
>>
>> ----------------------------------------------------------------
>> Memory controller drivers for v6.3
>>
>> 1. TI Emif: simplify device_get_match_data().
>> 2. Renesas RPC IF: Few fixes (missing address set in manual mode;
>>    decouple driver's private data structure from other drivers; unbind
>>    and rebind due to triggering managed resources allocation from other
>>    drivers) and bigger rework around improved runtime Power Management.
>>
>> ----------------------------------------------------------------
>> Geert Uytterhoeven (6):
>>       memory: renesas-rpc-if: Split-off private data from struct rpcif
>>       memory: renesas-rpc-if: Move resource acquisition to .probe()
>>       memory: renesas-rpc-if: Always use dev in rpcif_probe()
>>       memory: renesas-rpc-if: Improve Runtime PM handling
>>       memory: renesas-rpc-if: Pass device instead of rpcif to rpcif_*()
>>       memory: renesas-rpc-if: Remove Runtime PM wrappers
>>
>> JaimeLiao (1):
>>       memory: renesas-rpc-if: Fix missing setting address
> 
> This is commit 21a1234f82cbf425
> ("memory: renesas-rpc-if: Fix missing setting address").
> 
> The same patch, sent by someone else, was sort of nack'ed in
> https://lore.kernel.org/all/CAMuHMdWpvuC2Cm41jCQm+rT8MZB5GN+Z0bPz941QzsHX17Ux-g@mail.gmail.com

Eh, thanks for letting me know. I'll drop it and rework the pull request.

BTW, you might want to add separate Renesas RPC IF maintainer entry or
include it also in Renesas SoC. Otherwise you don't get CC on it.

Best regards,
Krzysztof

