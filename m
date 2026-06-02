Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F31D3B5E08
	for <soc@lists.linux.dev>; Tue,  2 Jun 2026 07:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780386442; cv=pass; b=Ga3CqMWgJPKM7Gq7h7VE13hLQ6PYh8okOKXcNhP3l/SIW5gKY1cL/0qt86eRKn71wDIvSwRM0MX9Og/MFOx/GuqVM0VZN4/UuRThSB0TAy3icTcUd+hajSAVYMAslyP+4lqarxLlnh06ovRvJWHc1jYdLLBcKd4dZUykJTtDuno=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780386442; c=relaxed/simple;
	bh=tSsP2qOiMDfZMEStOA5Jj8GLDM7ZmkRpJHsPd7CKvlk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=c0D4BvblatXWjDGo8yxtM7aWHmCpNpl7x+dxYM+ayMNWejuMsuAK3unCYK+nMGLyIycrT3SzXZ3oK7eEoQIbPg2Y8mF5mEU6s9cazoPsYCT3iGEw9/pt0l35KUJHLMaYyCX6fFTH7UufWeC3OLLkBcvf9h1Qy0wwhzhMfK8xxpg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UpfjsI50; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UpfjsI50"
Received: by smtp.kernel.org (Postfix)
	id 3F5AF1F00899; Tue,  2 Jun 2026 07:47:21 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1780386441;
	b=ndIg5y5r7kw9Y5Iu2F/lOwRIXToa1Vg7arp1L/Md1gqd4e+byMd7IQmV2qYNOuZTqtvm
	 u8Wc70rFxZ+i6r8Y2qFR/ZD0AMbG1Jv08K9cyT0avagWnnkLXkwNeyyvs4d7ij7MGk93f
	 /ZNkObOtKfxk0hjlQWD0jU94ILLEwi4un0G+eQyLVdectjuBE3kt5Gfde4+VM4jONqZDM
	 0g+Jt8X6Jj2dAWNhZAe+C9sgYRBMRxapLfzDA5GVpKCH8nOYDgZ/XAA1GOnkXQK9JHlxW
	 7tubOhJYkbTLnGnWINg1EWGVXm9i4lGMMXcR4uKPfLMeTUtu7qnJm6erRvqkbOzPAxQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1780386441;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:References:
	 Content-Language:Autocrypt:Organization:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Vh2zzywQb2LDD0ApyXrtv/dbmsJmDaoaJ1y3lBs52fU=;
	b=fSXENUHenLN34bDFqRA9kZM2e/46zbsksl2MNuOhcPBOYQVZTvFjGS3NQL3bvshoNp9/
	 vfzGNxkNOr4Etud8WBsJBuEOUv+vbeeDWlMadnzLcq9vuhuF7O8G2aTntkPSkiiVbz0Jd
	 MLnVZb8F/SEnfxwYPt3S7Gei4ILdMB2PMRII1sXRJZnibOnG6s5CA5nHbKIDoa6C4+qCM
	 SE5ZU1qBcjR2+LfxS5dFA4e/DAJGTs8ZkA3AjcX3w4tgbvtg04lGikZPNgLvXIbIIkV5c
	 KubjaeQPokJrPgpjgTfdjZeC8SrdCppo5ug/VXblOG6ndpAGRgSkczfTSZ9moMNgBLg==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=UpfjsI50;
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5173F1F00898
	for <soc@kernel.org>; Tue,  2 Jun 2026 07:47:20 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=UpfjsI50
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 5173F1F00898
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-45ef6565cfdso1672034f8f.0
        for <soc@kernel.org>; Tue, 02 Jun 2026 00:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780386439; x=1780991239; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vh2zzywQb2LDD0ApyXrtv/dbmsJmDaoaJ1y3lBs52fU=;
        b=UpfjsI50LTQn2YDP+gEmFH53ONMeaGlLhK8Y17A+IrZ8OphoP+bAsuNo2LG5trwRrQ
         LPXb4kRb2cQ+Fm9+0+UUFjWS0QaWtnRXJA835T662EugeSaG7NNVIDXZ4otY2FV0xurT
         LSjJa8rTlQLMsba7v9I/CGzeT/vW6xrlQ6Ez31kWV43AQcM4aOzk1hICiObOriPny+sO
         HvQHeombQBb/ESKop+5Fq09DKCpW6+KuJDDbScGRZdtSaa1pLlHRdnSm6Khz8FIFA0Qr
         qqz81neseGBCmHvdYeH4b0up2LdcEsc6BvSVCOFHhsTYqOmSnG1EbVLRwXUOZfpnAeFo
         zRuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780386439; x=1780991239;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vh2zzywQb2LDD0ApyXrtv/dbmsJmDaoaJ1y3lBs52fU=;
        b=KPajsV54Aw0P36dAGWHE16gsP8HzrXEeBMJIqMXYLcc6BGGEQ/2i1cfnsRP1gJ/mZc
         oOckgZVQHkPV1Qc0L3gKJMhOTkYAwcGYL+ma7HPQPcShTMulnIAWgrOvHv1BwBKn4wXs
         xZE1APCwwrapgvWxdhWa2d47g4BUfg0Ksp7t4TvSHabqqTJkdNMJypZQjF+4yhILzqEv
         HNHDuyv1kjBLPNd/cNiG6O5zIUl+TWB70xDkr9Vhqb2f1ObO69bepCPFF22VNWTG/mtv
         i4L96gL2iYZ1yPTwqCcVy2gVyiLjekmbwgVvOzVYw2ejoEn9tFjxZDVQbAd5LeKbFgDl
         PKjg==
X-Gm-Message-State: AOJu0YyNxnYWivz2tZAsJyiEpxti103+mLcI6658skPYHPPVKVwiu8C0
	0VnM4duaHqMwxmkE6AaXpHgIB3UxgIEA+dB0NMOWFXSttRRr/gE4MPaAI9Sv4LtzOTE=
X-Gm-Gg: Acq92OEbYSE5/IK4ZjgGJpFPUGCsCFNN9snTH2zsIH12TTMLYLDSLElQNxtEjmMWr2k
	SB2409t9uawnrvajbfV+oR3EM0may9i4aQo45OxLRKA9Ky57ObNBhCEEv89NKeIkpDa2jjuJfqQ
	H5XkpSptjGESs0OW9DV5/cDtZU1f/ouIQk98+h4q0aUImggXEpRAQsAXTRPUFHlKEGh2O2VzkK4
	qAoGz+oa6cH84u3yiKw1PUkLOPWenpCtoF9el7Qfh+/JVPWsDTjCAX5xhaOBpbwXT+H+IOpE+eL
	tN9SzdG6T8/q3JaAjJgwX8OzM7+pRRuU1my4kONseRxSsGftksX/PuvPSGHEgl5mTHucN6O7Dac
	SHcdTgQPQQY4ci0bMwSCoFfvrjz+b3QkyXkNVfjY4YAMnSSCTTi60VMx17QQg2lQH3XK7NjROgL
	CkVb6GOBDpAwnNPJfFKCQtHcRG7cCsHdCQBeqgmWKyvFn1e2rgPTnvfd4RnCan0jLDz8p9dC1Cw
	lGMAGLsgzJetQp7gL1GVy2CLNh3
X-Received: by 2002:a5d:674d:0:b0:454:a41f:d082 with SMTP id ffacd0b85a97d-45ef6aea78dmr20394102f8f.3.1780386438514;
        Tue, 02 Jun 2026 00:47:18 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:13a7:124b:487c:e2bc? ([2a01:e0a:106d:1080:13a7:124b:487c:e2bc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34b834esm31159663f8f.11.2026.06.02.00.47.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 00:47:18 -0700 (PDT)
Message-ID: <9267eeb5-a221-4108-bc7a-57e88347e7a7@linaro.org>
Date: Tue, 2 Jun 2026 09:47:17 +0200
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [GIT PULL] amlogic ARM64 DT updates for v7.2 take 1
To: Linus Walleij <linusw@kernel.org>
Cc: soc@kernel.org, arm@kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <16fc7412-c470-4f3f-b6c8-55c35698a424@linaro.org>
 <CAD++jLkiZD6tyUW6k2wt_TD3MeLNVDZNa0N+Rhwb0mAAGfLMvA@mail.gmail.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <CAD++jLkiZD6tyUW6k2wt_TD3MeLNVDZNa0N+Rhwb0mAAGfLMvA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 6/1/26 22:06, Linus Walleij wrote:
> Hi Neil,
> 
> thanks for your pull request!
> 
> On Thu, May 21, 2026 at 3:19 PM Neil Armstrong
> <neil.armstrong@linaro.org> wrote:
> 
>>         arm64: dts: amlogic: t7: khadas-vim4: Remove invalid property
> 
> This commit has a problematic Fixes:
> 
> commit 6f14ba3c3fa3d67b72e052f431f6776470eb2cbd
> Author: Ronald Claveau <linux-kernel-dev@aliel.fr>
> Date:   Mon Mar 30 14:11:21 2026 +0200
> 
>      arm64: dts: amlogic: t7: khadas-vim4: Remove invalid property
> 
>      Fix introduced invalid property for Khadas VIM4 sdcard regulator.
> 
>      arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dtb:
> regulator-sdcard-3v3 (regulator-fixed): Unevaluated properties are not
> allowed ('enable-active-low' was unexpected)
> 
>      Reported-by: kernel test robot <lkp@intel.com>
>      Closes: https://lore.kernel.org/oe-kbuild-all/202603290828.5gt393t6-lkp@intel.com/
>      Fixes: 60eff75ac67b ("arm64: dts: amlogic: t7: khadas-vim4: Add
> power regulators")
>      Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>      Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
>      Link: https://patch.msgid.link/20260330-fix-invalid-property-v2-1-228c51c8de93@aliel.fr
>      Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> 
> Commit 60eff75ac67b does not exist in the SoC tree nor in Torvalds'
> tree.
> 
> What's up here, it looks incorrect?

Yeah sorry it was probably based on an earlier apply for the previous rejected PR

The right commit is 8f4e4fbd5072 arm64: dts: amlogic: t7: khadas-vim4: Add power regulators

But since it's in the same PR I will just squash it...

@arnd I'll post a v2 of this PR with this issue fixed.

Thanks,
Neil

> 
> Can you look into it?
> 
> Yours,
> Linus Walleij

