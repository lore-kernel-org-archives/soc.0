Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B9E3446CE
	for <soc@lists.linux.dev>; Tue,  6 Oct 2026 11:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791284403; cv=pass; b=FXS3qxIdmceBc6QV8+KMiaREChGshCTeywi+6MMCp8VrrOk61SCRmjKl5F0IhEGN1AZAuVFFk5cJXvGvVVxX3VANCRf5KA7/aQ6R/dD+gYq+e2f7lhyVYR+lPvo4LeS08TokFODLYmp/uTDeO9mde9XCPeTnOI3JNMW0jTP/qnc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791284403; c=relaxed/simple;
	bh=sdOoDvHka+kkLSIjI9ZTsPid+q0RJ6MxNVhyJ3QwebU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=sV4JuRS1murGqlPgVaXuCcAE4ipuL55jwcay42bUHraMf05BWHKSNOj3Innf+Aa3m6zmIDnGSDAFsS1pA14vuVkIYiDUuxdAVYZjS4dE+Y68joHGGPEdB/71v6ubuRguHfonlo4L6ll9U/6y7U+spoYx0P4c7KzKmsFE5NBmeHs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rD4yIDac; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rD4yIDac"
Received: by smtp.kernel.org (Postfix)
	id 7994E1F00898; Tue,  6 Oct 2026 11:00:01 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1791284401;
	b=Fdrpp7kpNqkoYzuLaaja+SuBSptf7TWvPHUvk7RDDkeKM5aIlMwH1pSc73p8ceOkIleA
	 Okk58foCGt0D0/xjUfpQPERwkcBnDB5VESYBpP8pT+PvERA99/Dvj9nZ8s1eikCHZDEbn
	 50Vhd/VuBBHRxp3B+h8ZGunorTq6SulaLnjLRJFpqnZfnAbf9alcfe6CBcOipfAD64vMK
	 Qk2kPf+i9uNHYoUCjfFGsYvwTUn8X5QSMByIMGSGIWf80/X8MtrJOis8eWcelMIkVLpJV
	 3kNZs7/SaCpIW+2whE5ocGALBOI/7vxrnj3DZKSm3KmzKfau2AX/kiir8ZJpbPTw4NA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1791284401;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:From:Subject:Reply-To:To:Cc:Content-Language:
	 Autocrypt:Organization:Content-Type:Content-Transfer-Encoding;
	bh=+nio9Hhvbka7Ed6Pqah8EBJxLi2/eirIVfDib3AzpKE=;
	b=z1peIjn9Fu4+YO3n7PcHfZjTM6ElnZvIQRvz8ShPunnqZGH3meOq0fHx6OGcWRNvsAES
	 Up1wywfSmsV7h+qssQayC0fB3r6oE7r34p20cvMbb0Az0uY81uFI3UIlKVPKzXBlu/pBt
	 dD8Cl6f9meKl+kkIir6n0yJ/N/U2fnGWqxM7MEgKG3v0Mb0Xsf7nE/vh5NXQTlmTSAzyQ
	 B1pxo+3MeaFHdalOtl///bitcYIuVPpez2SkoA7muRu0A9PP6rF3rXtjyGZB0IpywAc2w
	 1Q8Ssoiwzriai5SYDhKvaTt1aYcNuX5Tjw1GWboejDTl1ffMBEG7/5NOLWFBJc4bZrQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=rD4yIDac;
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A9A881F00893
	for <soc@kernel.org>; Tue,  6 Oct 2026 11:00:00 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=rD4yIDac
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org A9A881F00893
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48b001cd92bso1412021f8f.2
        for <soc@kernel.org>; Tue, 06 Oct 2026 04:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791284399; x=1791889199; darn=kernel.org;
        h=content-transfer-encoding:content-type:organization:autocrypt
         :content-language:cc:to:reply-to:subject:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+nio9Hhvbka7Ed6Pqah8EBJxLi2/eirIVfDib3AzpKE=;
        b=rD4yIDacZBc0RtNgk7hcB9wxnS+U2fkdGQ783wL0Q95OFEVz/FHSxUvI1CJYwOi2cT
         BdpUrPvho9g+WitQt0eA1EbyP3qXfPfKAptZwrtZmyJjPrKYp2quToEdnhj41m8Pae4u
         Bvkj0RPuOVhopIoyIxNEH8zbJwB8ReVbX5E6E9+MUbU243GAguGfUMO8kiLPZ1c87gvO
         WMu+0Eqn24ZgQRBKsQK491MlySnWH+Gg2UJQwC21NKJqerzpyvf9iSpz3QT5b5Z/xGOv
         vCuKp/WIZVq3ys7fUJbp8UEuZHLFDwv5GUcCJukhMmfPNQgD3MPJmXLVqIrVlIcySawP
         oxxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791284399; x=1791889199;
        h=content-transfer-encoding:content-type:organization:autocrypt
         :content-language:cc:to:reply-to:subject:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+nio9Hhvbka7Ed6Pqah8EBJxLi2/eirIVfDib3AzpKE=;
        b=v2gdBZo/fybtr9wYYDI0gzZeAMcwpIvPUtBXdK4z8LiFduAykaDA6g9ESNohVyFkGF
         HMpIQa62KIbCSZWkXV1sugku3X5EZFFWgLF/owK4juc7LCnGbRp4MV2pBKCSEyPyiY6m
         QprvXUkyhEt/53VzrR8J91LtdJx81rAGG4DcAkQWO6gqIvwmKpAEgihRhGsMYAlLCLAX
         lgIcq/4ZPLQ5QJJgaEipgUKAIDPgwh7TtLwhPW1wsnQno7f3jzzaBWiQ02hrGO9kApyZ
         2mpPA5H9bYqMXzQRH49zAxytOoTNQifO2sy0k+m8E+6ReV2aaOWnZcOv+E9rslr4aGd5
         GqWw==
X-Gm-Message-State: AFq9FYKDXg1x1zZ9re6VUF51lsDvA99ezcIzwL/qsKJz7V6HKAEEm/vs
	RIk1XbNOollg9yZwBa4lgR/nihu60sOm0BSfT04KLNZqJF8YKMIoPGNSqe0Y5Upf2GWy3/bWs4q
	EC3+PfnLcHg==
X-Gm-Gg: AYBFou2dpWoDVWodjKYcR7akA5y6YaSvrZDLEJwe2cdHPYbYVLBskH6SAMnyU7anqtX
	UWQF8jMI2i72Y456Gb8DDCMDAwxK9Eol1Q9qSsWiDWvetPWtcgq2hMYCoBF7KH4QgMvPpz/qKzJ
	uScmV+tK/W6GuZ30LWq4Fk64ZnK8TsSr3kCCpYfiFCppaZjLyco1o6v6Ni7RXkhbSYjOyggpuds
	iQWDcj9QQKi6Jt/6lczdweeCyncQPwCI0AqkWUIP/zrV7w2WzYUwXdrn9lVE+iEthsli9Mdk3Ya
	11k2UhsuWMoLrN5PL2A1+Z17E3X+Wd7KbZSaT5sSBAP/yOQ6Q2evSFWaadTSy/h5DdLsFSCicfK
	gZSO2ZPElWJykl5Bmf3yZ1qwZvTwPKH4chkC6Cvl+QjRBMs5zyqUVGRDzBODR4si9f4Hk4GnAJ5
	kbaG110F1AL0jdzUkyxMEbMnjkWW4GWLRWCyBMNGuKbo8Fa5u6zvmoXLXyeLXmMF8k3LWrqk4VA
	FH33nCjEOss6dYv5a+IrJezM8+5wmo=
X-Received: by 2002:a5d:5d0d:0:b0:487:b4a:3f54 with SMTP id ffacd0b85a97d-48c4800336amr17791685f8f.29.1791284398668;
        Tue, 06 Oct 2026 03:59:58 -0700 (PDT)
Received: from [192.168.151.96] (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c622907fesm10290942f8f.26.2026.10.06.03.59.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2026 03:59:57 -0700 (PDT)
Message-ID: <8987c69f-5576-4358-92e4-e9e3b4f4f2dd@linaro.org>
Date: Tue, 6 Oct 2026 12:59:55 +0200
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic ARM64 DT updates for v7.4
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

Here's the Amlogic ARM64 DT changes for v7.4, containing spaces
indentation fixes, MMC/I2C/MCU Fan features for the Amlogic T7
based Khadas VIM4, clock measure nodes for Amlogic a4/a5/s7/s7d/s6/a9
and finally changes to properly define the NOR flash on the Odroid HC4.

Thanks,
Neil

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm64-dt-for-v7.4

for you to fetch changes up to b44e2be772f866985cafdf90355285069ea68495:

   arm64: dts: amlogic: meson-sm1-odroid-hc4: run the SPI NOR at 40 MHz (2026-10-02 21:30:26 +0200)

----------------------------------------------------------------
Amlogic ARM64 DT changes for v7.4:
- Spaces indentation cleanups
- Amlogic T7
   - Pipeline Clock for the MMC controler
   - I2C controller
   - MCU node for FAN control for the VIM4
- Clock Measure nodes for Amlogic a4/a5/s7/s7d/s6/a9
- SPI NOR #hold/#WP and bus speed defining on the Odroid HC4

----------------------------------------------------------------
Chuan Liu (6):
       arm64: dts: amlogic: a5: Add clk-measure controller node
       arm64: dts: amlogic: a4: Add clk-measure controller node
       arm64: dts: amlogic: s7: Add clk-measure controller node
       arm64: dts: amlogic: s7d: Add clk-measure controller node
       arm64: dts: amlogic: s6: Add clk-measure controller node
       arm64: dts: amlogic: a9: Add clk-measure controller node

Igor Velkov (2):
       arm64: dts: amlogic: meson-sm1-odroid-hc4: mux the SPI NOR HOLD# and WP# pins
       arm64: dts: amlogic: meson-sm1-odroid-hc4: run the SPI NOR at 40 MHz

Krzysztof Kozlowski (1):
       arm64: dts: amlogic: Replace spaces indentation with tabs

Lucas Tanure (1):
       arm64: dts: amlogic: t7: add the pipeline clock to the MMC controllers

Ronald Claveau (2):
       arm64: dts: amlogic: t7: Add i2c controller node
       arm64: dts: amlogic: t7: khadas-vim4: Add i2c MCU fan node

  arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi        |  5 +++++
  arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi        |  5 +++++
  arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi        |  5 +++++
  arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi        |  5 +++++
  arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi        |  5 +++++
  arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi       |  5 +++++
  .../dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts  | 13 +++++++++++
  arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi        | 25 ++++++++++++++++------
  arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi  |  9 ++++++++
  .../dts/amlogic/meson-g12b-odroid-go-ultra.dts     |  2 +-
  .../boot/dts/amlogic/meson-gxbb-nanopi-k2.dts      |  2 +-
  arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi        |  2 +-
  arch/arm64/boot/dts/amlogic/meson-gxl.dtsi         |  2 +-
  .../boot/dts/amlogic/meson-sm1-odroid-hc4.dts      |  4 ++--
  14 files changed, 77 insertions(+), 12 deletions(-)
