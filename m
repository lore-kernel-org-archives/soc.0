Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B11616F8F5
	for <soc@lists.linux.dev>; Mon, 17 Mar 2025 16:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742227849; cv=none; b=Vx5IhhgGQam46gWBeBpP+zE/RCDvYbOLPyo2pW/df2pcwY+Tp3R1NQm+WGBZ9RGymrnkvdDI77Q/JLTQ0SRUdWF66pB9ghWgDI1Lg6LMlzDH6ujBP5bgKG+dQeV3f4umNWqbBeqcepDzS1hKRjODLSZQ0jHJnIOIqNfUBQDqSy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742227849; c=relaxed/simple;
	bh=9Nc5MQppNiZAKZTH8c7l+sPzm5VO7NlmZU6oMzSSYkM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=RtlBOg84eHVC2VuZTYvbEv4roTULwPiFvX94VHlipeVAd0B6kc9C/iZmUKXoVO0z74qdrjkFxBIKuAsNADZ5CT8RG0plPaPtJCL0PgMq75g05dKTKZ7fTujHMlu/HLg2J+fBZ+1ziLsGgtFgd1zaxqhj5L47RHwKrtzc6d6iLKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kp2HgKBB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kp2HgKBB"
Received: by smtp.kernel.org (Postfix)
	id C32B3C4CEEF; Mon, 17 Mar 2025 16:10:48 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C47DFC4CEEC
	for <soc@kernel.org>; Mon, 17 Mar 2025 16:10:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C47DFC4CEEC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30613802a6bso51869031fa.1
        for <soc@kernel.org>; Mon, 17 Mar 2025 09:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742227846; x=1742832646; darn=kernel.org;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y+hHFzTa/k47glBM85zSNm/4Usff7fJ5DMa71YX6C/w=;
        b=kp2HgKBBzB8X1D9LdJ9g90hpadrVBr0Y0BYKUJuZKuXdbY6RYrmGhdomxHDPS+sU5y
         iwd0LiAMUgXRvgtPxz2CQy0McIVDlb+GPwoIm3NeV1/EKDMb04XMA5z5CNNbCCzEVdoi
         LP7K235BmiM4G9+94P2sQqH2T6gRogNU/GKFxxemMNATLpSMsRucbTDd4ahvfc/mipKO
         CV6U4UUMp3pGfj70WeqjuKWPMVVTXxociFSmnteFcKunrSM4QgP4vuugn1ECDXx1sKv2
         ebRiXCqvSxAzVnELIUD2owfpzDSCDa4XFvOgD5NAuN6F+ELslZTnlOBAxcBGRVmS20Np
         kCFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742227846; x=1742832646;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y+hHFzTa/k47glBM85zSNm/4Usff7fJ5DMa71YX6C/w=;
        b=dgM3cMMDUvIyZjzBItnb+rqn/JP0stDEbsCPjVf/YNnV/um6o5Z0Y6IV3eslFgBeVz
         XdFCs1hnhDnQMXCzcaCiYehTLA3ojq/MUOvHYGvhljsEsBq6XEdXrhib1+FQKfxkww3p
         2osxOg6mZ7YHewlOxdhWmKhxx/sPVR7/iJTK7tGvcHJThoLXUT4ISvEpt6me8Dmy6UGU
         S+cvOn+emwmzkGVCBiGnP4D6hWYCUiNUNLTNuDFwory0kxfUT06rUfFKvPt7NPaP1xLk
         VT0HM13OKjIF2sFm+e4Er38sspZc+itb5aieNFDO9yRY6a816/4RrrRi0iJgA8cjQegH
         J07A==
X-Gm-Message-State: AOJu0YyZ7gccfJnb+53m5DsB+tDYVMPAftCijCfuiaHOqIaszi182vCs
	qNvUCALnwEk6iuG9kG13iM3qSqe/58y978yg5CbR5K3Wu5NozsJeUTLY0LF0alS414x7xr5Jm3W
	4
X-Gm-Gg: ASbGncsYIMEZMWW0lipgrdif0+zqJoebLWoGfWOrek0Oj50Up+KTqL/XQ0HYKZG3rSF
	aFOA8tu3YzgeDNxJHwl36LVdfT/1d9AMgEhc53MFbuDWJi+aiCpQmE3OHKeIWedLA7kc1PFhfYr
	SQS63za20zWR2S0N+EgFhf3sHEdMgrxlqzClRd54WXLcRVZXkE/8fOJqjqy/xs5+K1M1ZE+E+95
	Xx75hJsyQHB2xua7ho4M9MTq401ePFQsIsE0lBaxHgcCSadW0iUa1t/jzahmmvgMWeAdVc2GdAT
	38lhQTyRfc4PpRKSnWdP8kMHBALJuTFn1naCyn/ZlIqbNr/iy3E6gzRlZev5n7N4B3I367vGhsM
	K95CKHwvhN4J2VcJEC23Rww==
X-Google-Smtp-Source: AGHT+IFZQpIZsOaRDvG49qndB2WRE6CllDvUSfKFpcbLjkgYwDfq2Cb3WLhsg7F3PZLRcEHd+KxEZg==
X-Received: by 2002:a05:6512:b05:b0:549:9143:2609 with SMTP id 2adb3069b0e04-549c38cf99bmr8874611e87.3.1742227845526;
        Mon, 17 Mar 2025 09:10:45 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:1a77:b55f:a550:458c? ([2a01:e0a:3d9:2080:1a77:b55f:a550:458c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba7c00e3sm1359707e87.64.2025.03.17.09.10.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 09:10:45 -0700 (PDT)
Message-ID: <8632a8fa-7af6-4fb7-ba87-297df4f084f5@linaro.org>
Date: Mon, 17 Mar 2025 17:10:44 +0100
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic ARM DT updates for v6.15
Reply-To: neil.armstrong@linaro.org
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
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
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Here's a simple changeset for Amlogic ARM DT to switch to the new PWM controller bindings.

Thanks,
Neil

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

   Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm-dt-for-v6.15

for you to fetch changes up to dbf921861985c8d1db339bc8ad0652b9064f2f84:

   ARM: dts: amlogic: meson8b: switch to the new PWM controller binding (2025-02-28 09:16:23 +0100)

----------------------------------------------------------------
Amlogic ARM DT changes for v6.15:
- switch to the new PWM controller bindings

----------------------------------------------------------------
Martin Blumenstingl (2):
       ARM: dts: amlogic: meson8: switch to the new PWM controller binding
       ARM: dts: amlogic: meson8b: switch to the new PWM controller binding

  arch/arm/boot/dts/amlogic/meson8.dtsi          | 18 +++++++++++++++---
  arch/arm/boot/dts/amlogic/meson8b-ec100.dts    |  2 --
  arch/arm/boot/dts/amlogic/meson8b-mxq.dts      |  2 --
  arch/arm/boot/dts/amlogic/meson8b-odroidc1.dts |  2 --
  arch/arm/boot/dts/amlogic/meson8b.dtsi         | 18 +++++++++++++++---
  5 files changed, 30 insertions(+), 12 deletions(-)
