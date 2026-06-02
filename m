Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22292C029D
	for <soc@lists.linux.dev>; Tue,  2 Jun 2026 07:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780386779; cv=pass; b=ajhaMdP3aXOpQsaY9on30EVgeZhxJVj7pFrUERpcQc4M65uvuEJ206c1TyZzG7Q0Nz6LXwwSbj+rkCSCyrgzjvEaEMBjOIpLcOY6qAEy9EtECPhsk032+QXx0WqUYIkcPdNlYRa/ifzO33I/saaUCimsQ66XqEMHJAW8EPSl2iI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780386779; c=relaxed/simple;
	bh=yNFRBreW/BX12EDuBGkXF8iRUYkym2vI2tdboFFQNGo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=dZxJYhaHDvx6H7iuN/99Go4NPrDvR7zR9Kb8t3UBP/FRmy/5w991GSljVk8t6Sx09H6aFsQE+iik1oWZ9KtXP9Ht0hEXqVH5N4OlZtsQ0Zt+ypuY+Wr871E9mumuI+t+ih9NA2Vv7h/z/qZ9q5+l9q0IpmRfmf0psru5KIq8hwM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P+i6wOYT; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P+i6wOYT"
Received: by smtp.kernel.org (Postfix)
	id 84DC91F00898; Tue,  2 Jun 2026 07:52:58 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1780386778;
	b=MdEsYgKzQ1w0BTod4TmN1ClrzaH2/kxrWxYmiZQ5/0TcWR193ZHvhG8lQkMRVA29Q9HM
	 Kb+qVhDOpiYLaAJhlrOJzGmszkEzVVWBtpOeXfsWGH/D8uQvEVq6VOlrrsM2aUBrWeBQV
	 FVr+h+ujsTlGimozaQt2iZm1RfH3OZ7e6ITF2q6uyKAWGw8phMNmW2TrSimLpz55FfOci
	 OoYUe/zainwuAB2/Jc1NP5Alsv1Km9+qEE4hYZxKKCbUF2mpWRPxi58zOnPV6mhf5pXu9
	 i8I3N3v6h3wkdNT+C8e9S9L0a/9ACFwePeAMbUEiCI2/wzwL86lZLy+k4fpxNRCKQjA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1780386778;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:From:Subject:Reply-To:To:Cc:Content-Language:
	 Autocrypt:Organization:Content-Type:Content-Transfer-Encoding;
	bh=Jx/6Xb8+7JpGADIReL9AI9hs8frXGu+k1KWWs2BVpLs=;
	b=ZloswZMlqXZ2VWV6n0dX8sCCuDCIoL2lowndxT7yS+uR90boe/4SQNdK9rj2yP6ircH8
	 7tU9Jq/1+Tt9AAP+Aphmt8y/QPNm8Wi1eU8HNCDlbLIp6HjNHdzvqJ0h9+cmpunBVOTPC
	 nbmDij/RgeBOfz6dWPVjxhBIzJvTpUA8Slxj+gvQo5g+LqpPSjUAVZ7OGt5btDvha9X1k
	 8mjMMgnFxAP43dGV9he0BXc8UrqSx1q91zn3vW2TYCeFqG/D1IPoejLfBxPzBhLvUR1xe
	 fDavmSoAiavHQ69owAcovB8hOQLw5BRio9D0qZYK9zl1wauGfYUZutwqAAtxsu1JWzQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=P+i6wOYT;
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8B5E91F00893
	for <soc@kernel.org>; Tue,  2 Jun 2026 07:52:57 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=P+i6wOYT
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 8B5E91F00893
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490aaeabdb4so10929945e9.1
        for <soc@kernel.org>; Tue, 02 Jun 2026 00:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780386776; x=1780991576; darn=kernel.org;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jx/6Xb8+7JpGADIReL9AI9hs8frXGu+k1KWWs2BVpLs=;
        b=P+i6wOYTzbbiF2X0VDhIPEMjrqvEnvdbI/tOGkpRcVsMTrf2q8vutFEaRRX84oQpeu
         dGU7hTZecj2VqgWJn0wh+0S8FbpCzHavFJI4DRdHRWb3V3XDMIMUneSu+1+zHJDnj23o
         9L7T8TGsdt4I0SbhOyXB7rwzTF3dPd57bI/n/UmwflQqu8dFoDJSrqUupowTkC84uk8L
         U2VmnAlfFQDSALpJZahhzF4DkO20L1YADx37OMZrrT8jZJOQaJBS39qLD4yKdBHvBokA
         T3FdRsqTPASTpZhZO6vElny/fYjl6Cl1F4mhJkIbW0H12HQJspAAfVgeum9PNZeU+z4h
         GmEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780386776; x=1780991576;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jx/6Xb8+7JpGADIReL9AI9hs8frXGu+k1KWWs2BVpLs=;
        b=ANC6f9kJS05/oHY8IkPjXFPbR5wGIhlK+ADGs12Rq1ETnJX66QWbupLPDiyKyyx01B
         56FVQvemPmnqSYgPj/2YdBVL/bLzxAyhvyH5cerCCePqIEFOIFo1ZCUE+2xdRYZKN/a8
         VAOcAxdwnDi+HG5sCFfyal4JlkNPvNSF2xnXxIjI7A3YyUNYfIqtZsmm9SIUex8TIV08
         lmVX9qUS7/dNhedjHyDAAKH9W59VzPi7Ev7+7bByUttIczpqdlqeeIzmz5AXJfQ3xt2e
         j1u7JngYKrG/w2j0RSvkjYYy0yjgydhx2auUm8Ybyww6EulywHfGw+5s09wawavDeDVZ
         qM+A==
X-Gm-Message-State: AOJu0YxTfRr2t8t7UJQrjoVqMTsmQ8ntX6oEyRer40irvpBb6lncQeFX
	8gyNQOnU4Yx2Y1NiISwOe2OGq7FFqkksKz33CnJhBmh2jyRS2bmrBclunuA7n2klFdLzlGuJHGV
	/4hS1
X-Gm-Gg: Acq92OF1zfldhCojjOM0ypwkSBRkSYLnqk5aBMcxletT45fRGwkZC4q+dAW7wqvPiNl
	xj6vQG8LiInQS1QAdMjFADW3AiV6yFQ+TmiIpy2nf5gYmG0UP57sldVwTENyBnrueewGXMbNiME
	xcZv1x7uSU1RphBRIIpCwhb2jclHwuY4Mbe/RnCrJQx0lf9mmBWS7D7kZI7lWpofhlL1+Vfqj7B
	AwLZG7ogKGC+Qt0PDdeqk1c+jt2kIr1zDknEB2sYNy0YjKm1MtmCKrW6dnleJqLEwKta8YhpR9X
	i99x++o9/GAU5fQQtxUKnMLVrdhpbsOJc5V6xV3IV1ti/odVZ7Y5kydA1jSxJrwGuaL/gnT9kNR
	uOZs454Pno88AqkrCgiFRy5i9aWOxZjt18Cyi4lG4LcLcv1C6kFjYkWjuexb1HxL2/3OlCMhbvf
	jnBqoVq97MmwoOsJoF91HcPw0xxYJtVOEHzNrJVpHt9eTl15dC2SvCXXIRjn5AIZHlLAb5omqJl
	BmXOLfXY4Z7HApx1A==
X-Received: by 2002:a05:600c:46d1:b0:490:a7ab:bbe3 with SMTP id 5b1f17b1804b1-490a7abbd7fmr191381215e9.0.1780386775846;
        Tue, 02 Jun 2026 00:52:55 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:13a7:124b:487c:e2bc? ([2a01:e0a:106d:1080:13a7:124b:487c:e2bc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0da5ae2sm44609215e9.0.2026.06.02.00.52.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 00:52:55 -0700 (PDT)
Message-ID: <9d4694cb-f596-4538-a437-6f2fbb6304f4@linaro.org>
Date: Tue, 2 Jun 2026 09:52:55 +0200
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic ARM64 DT updates for v7.2 take 1
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
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

Here's the v2 of Amlogic ARM64 DT changes for v7.2, contains improvements for the Khadas VIM4
and VIM1s SBCs, plus some additions for the Phicomm N1 and a couple of low priority fixes.

A bad "Fixes" commit sha was introduced for a commit in the same PR, I squashed it with the
appropriate commit and dropped the previous tag.

This PR is largely the same as `amlogic-arm64-dt-for-v7.1`, but I sent the fixes
separately as `amlogic-fixes-v7.1-rc` as discussed with Arnd, so this tag
`amlogic-arm64-dt-for-v7.2-v1` is based on top of `amlogic-fixes-v7.1-rc`.

Thanks,
Neil

The following changes since commit 174a0ef3b33434f475c87e66f37980e39b73805a:

   arm64: dts: meson-gxl-p230: fix ethernet PHY interrupt number (2026-04-21 15:46:29 +0200)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm64-dt-for-v7.2-v2

for you to fetch changes up to eec0722a5cac08ba995847c8eb63118cc708560b:

   arm64: dts: amlogic: t7: Add i2c pinctrl node (2026-06-02 09:49:46 +0200)

----------------------------------------------------------------
Amlogic ARM64 DT for v7.2 v2 take 1:
- Khadas VIM4 (T7 SoC) features:
  - Memory layout fixup
  - GIC register range
  - Model name fixup
  - PWM, eMMC, SD card and SDIO support
  - PWM LED
  - I2C pinctrl node
- Khadas VIM1s Features
  - Bluetooth
  - PWM LED
  - Power Key
  - Function Key via SARADC
  - RTC
  - Remote control keymap
- Bluetooth node for Phicomm N1

----------------------------------------------------------------
Jian Hu (1):
       arm64: dts: amlogic: t7: Add clock controller nodes

Jun Yan (1):
       arm64: dts: amlogic: meson-gxl-s905d-phicomm-n1: add bluetooth node

Nick Xie (9):
       arm64: dts: amlogic: meson-s4: add UART_A node
       arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: enable bluetooth
       arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: add PWM LED support
       arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: add POWER key support
       arm64: dts: amlogic: meson-s4: add internal SARADC controller
       arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: add Function key support
       arm64: dts: amlogic: meson-s4: add VRTC node
       arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: enable HYM8563 RTC
       arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: use rc-khadas keymap

Ronald Claveau (11):
       arm64: dts: amlogic: t7: Add eMMC, SD card and SDIO pinctrl nodes
       arm64: dts: amlogic: t7: Add PWM pinctrl nodes
       arm64: dts: amlogic: t7: khadas-vim4: Add power regulators
       arm64: dts: amlogic: t7: Add MMC controller nodes
       arm64: dts: amlogic: t7: Add PWM controller nodes
       arm64: dts: amlogic: t7: khadas-vim4: Add SDIO power sequence and WiFi clock
       arm64: dts: amlogic: t7: khadas-vim4: Add MMC nodes
       arm64: dts: amlogic: t7: Fix missing required reset property
       arm64: dts: amlogic: t7: khadas-vim4: reorder root node
       arm64: dts: amlogic: t7: khadas-vim4: add PWM-driven status LED
       arm64: dts: amlogic: t7: Add i2c pinctrl node

  .../dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts  | 215 +++++++++
  arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi        | 482 +++++++++++++++++++++
  .../dts/amlogic/meson-gxl-s905d-phicomm-n1.dts     |  15 +
  .../dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts   |  81 ++++
  arch/arm64/boot/dts/amlogic/meson-s4.dtsi          |  45 ++
  5 files changed, 838 insertions(+)
