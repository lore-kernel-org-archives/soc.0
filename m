Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2F820011B
	for <soc@lists.linux.dev>; Wed,  6 Nov 2024 13:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730900761; cv=none; b=s9pBpMEfwo6whvE4vovKQzEzEEgq5LWslppC6946jOuQf2l2I2Fr6nStiOFoRgU1XCh5rvrAOfKjBMLJDuSKjXjHnanNINWhri2JQtReC4FkkF5TAavB1HCWk83pWySFK88MKq58paa4tzr3F5Z+noS9T3mAEmtGV908vhC0SGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730900761; c=relaxed/simple;
	bh=vSUkj+Bq7bqCAk7/gcp4qEs9ljIAVfgjhVyGYQGltXY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=UgrF7+LJtNqwXkqdV2SvCWRUCKKOggH2IlkJsFZ1IbwunOscha1ZynlIxUQzKrSHWaLR9ESTVraVABQVfR6DrpxpONmtk1ZlZmKdq4XqH+m09ewpmVdqBexIo1bb2h3qVoe1gystq4hcM5LvSK0pzGPToVuSZbET3Br1CM/9Sow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hV5SOyvf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hV5SOyvf"
Received: by smtp.kernel.org (Postfix)
	id 14401C4CED3; Wed,  6 Nov 2024 13:46:01 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 21067C4CECC
	for <soc@kernel.org>; Wed,  6 Nov 2024 13:45:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 21067C4CECC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-539d9fffea1so6932501e87.2
        for <soc@kernel.org>; Wed, 06 Nov 2024 05:45:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730900758; x=1731505558; darn=kernel.org;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ehYC5jyHQqP2TfK80B/7xWqvzi8c0/X0fL6unhG4urs=;
        b=hV5SOyvfqDV3rDw4HJBJq05Xjczn+W/E2nPMO4bLd7nUWRuQBVl1P0OVKm0V+bT6Dp
         d8I4+oQWGO8CZNyR1P+2GlPKkzSiCg4HCipAnQ0wGJ3rNuad0RlciONtOr/+RtuQZ4EE
         h+fCSbsnb/LB+kN8gYqaGv3H5MjuTK/pKA9QyhGZas87MpmTa+ywalpzJ5sgxnbDMztB
         zNX+8IKEKkequs2mG0aAMgud17XBm0XgelLakz0o8p8WQpZjNvFGgVFd20s7iHHNzXON
         CTNT4kbPQAl0dlmIlFmsLRvGHnpQ9/LrCtEs6IyTYHLd7yHRkyUINK8zjJVl5RSFCnQi
         pyEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730900758; x=1731505558;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ehYC5jyHQqP2TfK80B/7xWqvzi8c0/X0fL6unhG4urs=;
        b=gtF4ao2LKQcxIdMRYVyXWeEvDmqqz0JuRA1vcBDnVpAIY64qQaklg9EnEYuJJcikT8
         e24Wrt1J813glq1eO1ktKPkXul/miApPDcsHxbf6WaCeEE3eqjgEQhgLfhyKr6cJDOYb
         SwHwoHWZTwU8xiqoyY3YAgS8rb+sxyMnK0NPbc8dhypY47IZ8THuLn23ewog0bIb7Th4
         E55W0Tm7ks2+glYGa7xqxTDJGUcwBVkKVQNdroIzmTFyRPzWlBGVm+OaJkML4qp4g7CX
         wANM36DQnc1K4BkngwHYdF0NuEm9Ilr/8/Fx3D/xVo3biPoarkuWaPDjAYKbjhG2YgUg
         GRtg==
X-Gm-Message-State: AOJu0Yx1MhtLR6o1LuGTJ+J7wFinwsnMwXXpe5BFOyf66jolKwia65E4
	ieMfg1AkPtX5rsMONqK9J/znGQ4B0lGzbjYuGKdbxaqxXBDpaq3YRJ2olf26Q6UOsd3CzmBnsaw
	CqeU=
X-Google-Smtp-Source: AGHT+IG36xkVt+ks+JYrBPCyJZNNr5to2RevB/PEtfvJ914bM+YQAJ+CS5sRJcV8XkOk11ShH2fhow==
X-Received: by 2002:a05:6512:3ba3:b0:539:eb44:7ec3 with SMTP id 2adb3069b0e04-53b3490fabamr19945832e87.31.1730900758178;
        Wed, 06 Nov 2024 05:45:58 -0800 (PST)
Received: from [172.16.23.252] ([154.14.63.34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432aa5b60cfsm23255865e9.7.2024.11.06.05.45.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Nov 2024 05:45:57 -0800 (PST)
Message-ID: <6fb3d64a-3913-4db0-9cdc-336af32a88a9@linaro.org>
Date: Wed, 6 Nov 2024 14:45:55 +0100
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic ARM64 DT updates for v6.13
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

Here's a set of Amlogic ARM64 DT changes for v6.13, with
PWM for A1 & C3, missing properties & typo fix.

Thanks,
Neil

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

   Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm64-dt-for-v6.13

for you to fetch changes up to be90cd4bd422e8ae235f534a2fa46d40dae0816b:

   arm64: dts: amlogic: Add Amlogic C3 PWM (2024-10-09 09:57:50 +0200)

----------------------------------------------------------------
Amlogic ARM64 DT changes for v6.13:
- Add PWM nodes for Amlogic A1 & C3
- Addd missing power-domains properties
- Fix G12 uart node name

----------------------------------------------------------------
George Stark (2):
       arm64: dts: meson: a1: add definitions for meson PWM
       arm64: dts: meson: a1: bind power domain to temperature sensor

Kelvin Zhang (1):
       arm64: dts: amlogic: Add Amlogic C3 PWM

Theo Debrouwere (1):
       arm64: dts: meson-g12-common: fix uart-ao-a typo

  arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi       | 364 ++++++++++++++++++++++
  arch/arm64/boot/dts/amlogic/meson-a1.dtsi         | 216 +++++++++++++
  arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi |   2 +-
  3 files changed, 581 insertions(+), 1 deletion(-)
