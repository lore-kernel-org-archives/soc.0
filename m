Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109E93B52F7
	for <soc@lists.linux.dev>; Fri, 27 Mar 2026 08:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774599582; cv=none; b=mMB8LFjlWLpX43K/ZGEPy65IlXOzCOkJ+OMS23sVT6zkU9/Wlo4nV7QUOdNrhFpTAO8UoA9bXSz0LC8sCLg2XBWFY12WDMPUfNy9BQhkdPWGY2yscBzN5UM6SPPARXC4PMQ56VNr2PkGtNqSDsvRfw0/6YrUhlLijXpAkRwK3FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774599582; c=relaxed/simple;
	bh=Tlrf9YQPpCEgfXEni1AJghCk6IXwsSp1qRIuz6TrIYI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P6Sxjkbyy7ofXgGYcJYXqoWAV/0pA88t9P9jiAC72fofzRah9Lq53A4ciVnLBxdVFmPzl3DHWHsoyf/cdXmmg1jP7vx9FOi/uqlH29A1Vt17hycWvyZF4fcjroLsth4csDieqqVosPTs8PLlTaL4mxfHeLg6kSkhmCheFrKlovI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e99zTECU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e99zTECU"
Received: by smtp.kernel.org (Postfix)
	id 9F583C19423; Fri, 27 Mar 2026 08:19:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6D48C2BC87;
	Fri, 27 Mar 2026 08:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774599581;
	bh=Tlrf9YQPpCEgfXEni1AJghCk6IXwsSp1qRIuz6TrIYI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=e99zTECUo1GWDxJCQjbuZr14lTWUZG8QtA6IbyQJ1NYaNHhOIyAzZ+kNtv+WOupiO
	 j1RrXWhKXc2wtT67tHlF9lhiFVDpbE159fs6IrFkbE0VktjG1hBxBbKOEl+pGlOMZP
	 s8g2F1v9aMv8Vb4MBQukTAKy8PxRO9+4QJ9hvWQLnv97WY4UIe0rAJQ93Dv0JI1eDe
	 DC4EPqXv0cWg4tip0AKbKE2gudNKoBVvFNor0xeBgxv4v4hqcfmJ4cFEQYQVwpjaPI
	 0w08T2QiXydDvbbnMpwBX4F55GSUk2Pw9eD+U+Gr61hEbW4c7dgxVKZKbBh7NtMx8c
	 UFVXkvLUfgEig==
Message-ID: <d7eb716d-9b9c-4474-a9ca-d44e96c46fc8@kernel.org>
Date: Fri, 27 Mar 2026 09:19:37 +0100
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] ~RISC-V~Starfive devicetrees fixes for v7.0-rc6
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 E Shattow <e@freeshell.de>
Cc: soc@kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Hal Feng <hal.feng@starfivetech.com>,
 Ilya Sorochan <k0tran@altlinux.org>, Conor Dooley <conor@kernel.org>
References: <20260326-astrology-rephrase-836ec663228b@spud>
 <4dd4ffe6-307a-442b-ae99-50c88d4e5b84@freeshell.de>
 <20260326-viscous-rigor-4beb18f77eec@spud>
 <9ec329b9-144f-4896-a89c-3af0b23e631e@canonical.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGVBBMBCgA/AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJoF1BKBQkWlnSaAAoJEBuTQ307
 QWKbHukP/3t4tRp/bvDnxJfmNdNVn0gv9ep3L39IntPalBFwRKytqeQkzAju0whYWg+R/rwp
 +r2I1Fzwt7+PTjsnMFlh1AZxGDmP5MFkzVsMnfX1lGiXhYSOMP97XL6R1QSXxaWOpGNCDaUl
 ajorB0lJDcC0q3xAdwzRConxYVhlgmTrRiD8oLlSCD5baEAt5Zw17UTNDnDGmZQKR0fqLpWy
 786Lm5OScb7DjEgcA2PRm17st4UQ1kF0rQHokVaotxRM74PPDB8bCsunlghJl1DRK9s1aSuN
 hL1Pv9VD8b4dFNvCo7b4hfAANPU67W40AaaGZ3UAfmw+1MYyo4QuAZGKzaP2ukbdCD/DYnqi
 tJy88XqWtyb4UQWKNoQqGKzlYXdKsldYqrLHGoMvj1UN9XcRtXHST/IaLn72o7j7/h/Ac5EL
 8lSUVIG4TYn59NyxxAXa07Wi6zjVL1U11fTnFmE29ALYQEXKBI3KUO1A3p4sQWzU7uRmbuxn
 naUmm8RbpMcOfa9JjlXCLmQ5IP7Rr5tYZUCkZz08LIfF8UMXwH7OOEX87Y++EkAB+pzKZNNd
 hwoXulTAgjSy+OiaLtuCys9VdXLZ3Zy314azaCU3BoWgaMV0eAW/+gprWMXQM1lrlzvwlD/k
 whyy9wGf0AEPpLssLVt9VVxNjo6BIkt6d1pMg6mHsUEVzsFNBFVDXDQBEADNkrQYSREUL4D3
 Gws46JEoZ9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLue
 MNsWLJBvBaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6ei
 OMheesVS5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wA
 GldWsRxbf3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA
 6z6lBZn0WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9
 YegxWKvXXHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt
 91pFzBSOIpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gU
 BLHFTg2hYnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/
 JoFzZ4B0p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu
 4vXVFBYIGmpyNPYzRm0QPwARAQABwsF8BBgBCgAmAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtB
 YpsFAmgXUF8FCRaWWyoACgkQG5NDfTtBYptO0w//dlXJs5/42hAXKsk+PDg3wyEFb4NpyA1v
 qmx7SfAzk9Hf6lWwU1O6AbqNMbh6PjEwadKUk1m04S7EjdQLsj/MBSgoQtCT3MDmWUUtHZd5
 RYIPnPq3WVB47GtuO6/u375tsxhtf7vt95QSYJwCB+ZUgo4T+FV4hquZ4AsRkbgavtIzQisg
 Dgv76tnEv3YHV8Jn9mi/Bu0FURF+5kpdMfgo1sq6RXNQ//TVf8yFgRtTUdXxW/qHjlYURrm2
 H4kutobVEIxiyu6m05q3e9eZB/TaMMNVORx+1kM3j7f0rwtEYUFzY1ygQfpcMDPl7pRYoJjB
 dSsm0ZuzDaCwaxg2t8hqQJBzJCezTOIkjHUsWAK+tEbU4Z4SnNpCyM3fBqsgYdJxjyC/tWVT
 AQ18NRLtPw7tK1rdcwCl0GFQHwSwk5pDpz1NH40e6lU+NcXSeiqkDDRkHlftKPV/dV+lQXiu
 jWt87ecuHlpL3uuQ0ZZNWqHgZoQLXoqC2ZV5KrtKWb/jyiFX/sxSrodALf0zf+tfHv0FZWT2
 zHjUqd0t4njD/UOsuIMOQn4Ig0SdivYPfZukb5cdasKJukG1NOpbW7yRNivaCnfZz6dTawXw
 XRIV/KDsHQiyVxKvN73bThKhONkcX2LWuD928tAR6XMM2G5ovxLe09vuOzzfTWQDsm++9UKF a/A=
In-Reply-To: <9ec329b9-144f-4896-a89c-3af0b23e631e@canonical.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/03/2026 16:44, Heinrich Schuchardt wrote:
>>
>>> I have done an ~80%+ analysis on Ghidra decompilation of the JH-7110
>>> BootROM, and openly invite anyone that would like to help get this
>>> effort to 100% is welcome to so that we may publish and refer to this
>>> for technical competence. I do not object to the community supporting
>>> this deprecated capability if there is any real documentation not based
>>> on rumors and memes; but no one has offered to do take a moment to do
>>> this most basic of fact finding. Evidently the StarFive maintainer(s)
>>> have refused to support this, GPL non-compliance persists and only a
>>> rough description from Hal has been written to the U-Boot developer mail
>>> list that does not match my analysis, all while complaining about the
>>> capability not being supported going forward.
>>>
>>> I object to this PR it is NAK from me on the basis of stuffing this in
>>> sideways without technical justification or review. Also I do object to
> 
> Concerning technical justification it is clear:
> 
> Distro images have been supplied with U-Boot on SD-card for years and 
> the recent work in Linux and U-Boot broke booting them. This needs to be 
> fixed.
> 
>>
>> The technical justification seemed to me to be multiple people saying "we
>> need this added so that u-boot can use the sd-card". The patch has been
>> on the list for over three weeks at this point, so there was definitely
>> opportunity to comment on it. I don't think I have been unreasonable
>> here. If current U-Boot needs it, then I'd still like to have it merged.
>> If you work pulls through and this becomes no-longer required, then I'd
>> be happy to take it back out again.
>>
>>> "riscv: dts: starfive: Milk-V Mars CM Lite broken-cd" as this goes the
>>> wrong way around, it does not describe the hardware; if some external
>>> carrier boards cannot deal with the capability of the Mars CM
>>> system-on-module having card detect line then that should be dealt with
>>> as a dtbo per-carrier board and not be replaced in the dts by a
>>> broken-cd, although at least we had this discussion and Conor made a
>>> decision with all the facts and discussion available.
>>>
> 
> As my patch points out the CD line is broken because it does not conform 
> to the standard established by Raspberry.

Initial E Shattow answer is not placed under specific commit, so I can
only guess that it is about "riscv: dts: starfive: Milk-V Mars CM Lite
broken-cd".

The commit touches only DTS, not DTSO, so how can you claim that a DTS
file change breaks some completely other board (Raspberry)?

This DTS file is nowhere included (and should not be).

Of course maybe the true question would be why anyone described a hat as
DTS file...

> 
> E. we know that by chance you have found a base board that ignores the 
> standard.
> 
> Your patch 4cce8b2503ab5 made my standard compliant baseboard unusable. 

DTS of some board is a final product, so it cannot be applied to a
baseboard, that's pretty messed DTS tree...

> My patch in the pull request does not stop your board from booting but 
> re-enables mine.
> 
> Best regards
> 
> Heinrich


Best regards,
Krzysztof
