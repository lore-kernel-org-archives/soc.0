Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FBCB3CC324
	for <soc@lists.linux.dev>; Fri, 31 Jul 2026 15:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785513588; cv=pass; b=fSnaJcHonLIYVCeZUQZuntX5P8Im7sGRXAdjtxvEuMW0d4YkPjrs7W+NKswT7YsgWrhUxCvI1r0nRdm1lad0L3lCSC0teZLvwLd/iKyk7gBoMnqp3KjEYrbBWFXuZRUSz3RjoZj5D62mx+tfiDTtVTRkmMTF62+IKG8lp1iYexs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785513588; c=relaxed/simple;
	bh=KaA4Q1bLFSKWT+/HrBpyeYqgswK4jBZuODwjdQeAV3A=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=KCtP/lNjf2zk46gn76La6zJNtfoDb5E9qPk24YROaoJSfIG0zLRulXZZe9lWuV7bE4pMUMPDVHE391mqWw3lLH5gp1kxuBJnH3dgHMPWuF8Rmkc6iRJuEfppYJfMSl19+JADrq5zXZFfWx1d0anVrRq45pcSWTeqTzppWSUSOlc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZtqW3EVs; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZtqW3EVs"
Received: by smtp.kernel.org (Postfix)
	id 3B0021F00AC4; Fri, 31 Jul 2026 15:59:47 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1785513587;
	b=3tDtw8B1lYVG+WOsyTS+CbWer+Dx+9ZoMS1wbIT+ovf7kqusgHCjOq6sjr0zpojieA5N
	 IvVcapdMn1yIoy8CL1D4N0PYBdX9QvMUKYXU+toJ6n3btd8dkHiKcc9JKqmTqaTzuojfr
	 SpCyxrA9b+JfsIRGK8niU+FqekSwynZL6zkCuqOhnSRlKo44g7thNrco5Qw+gajkOyPV/
	 akwk8HgfTMXIjyZNqZS3XAKNktErJKQQa0TGJOhEqndsIfSjgwAbQl6eSGmSXxbjvUKVn
	 oYPt8EaxLBNI4mylidoWUWoj/+xIN8i6P/wrBjUIUc3Pr3ukavpSykcge9bsYqOIqHQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1785513587;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:From:Subject:Reply-To:To:Cc:Content-Language:
	 Autocrypt:Organization:Content-Type:Content-Transfer-Encoding;
	bh=a87j8swmEQc4k8uOXUNzJXiAtCjtnQaei+ph1mC40T8=;
	b=i3CjpEKr31jV8ZSoa/DbSe827h7qAHpAh0t4VFb3isfvJLTIU6wbOxnhP8qFw7M6L0eV
	 eDWPuR8H18UWgh42sus/mu4qRMnABerH96UV1KEbk5HVAUVskliyFGyXaXEAxJOUKNcvz
	 2S/f/fJyWXfobB3oyHMRNkkWmYkDgfuNiCHdaH2wJDHsXm8b3V0HafDeDsbOuOA89oplK
	 8hesLAOY8vCusB6O+pFXNCmsXnOWaxwyUgmjKiMy6lOrBy7C11u2spyZQrgUDid4H05nl
	 myR/KzlW1l+Q65PEhlY94ydR882JkeAIxCXBf4KQmYiRNf8YfHDzRG30slffJW8lVmg==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZtqW3EVs;
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F04A91F00ADB
	for <soc@kernel.org>; Fri, 31 Jul 2026 15:59:45 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZtqW3EVs
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org F04A91F00ADB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47f633e6058so1189029f8f.0
        for <soc@kernel.org>; Fri, 31 Jul 2026 08:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785513584; x=1786118384; darn=kernel.org;
        h=content-transfer-encoding:content-type:organization:autocrypt
         :content-language:cc:to:reply-to:subject:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=a87j8swmEQc4k8uOXUNzJXiAtCjtnQaei+ph1mC40T8=;
        b=ZtqW3EVsxeR/QwDjKcRbDNBIWs4AhMZj9wQy5ILwMP5i62WQ+vb9Xcw9jZ4eeVLk2u
         edVBwntlbg6qkqvFuOyOkGRskIjdkPJ7m7VwzOvd4h4aepH7l0KFEg5dMZLAMDvv75XM
         7bCe/CG5ZxFj1vdp1pZ87PqJNYRTqr66Ilb4sTLzO8x3BD1/zbM+66mam+BGnW1bUqGn
         Gdynk0GA4NEIAd/0CPHvd/RNy4QC9+8Ww40DKjMgcUmGd1iBUPfHwiqAn0t1PONPm+vf
         lehWSsEGwkoyNLtnbg/VfGWxc0YipEwskNEIYG9gfJWaEVUU/gqtw3GdvVzyxIccRdYf
         /ixw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785513584; x=1786118384;
        h=content-transfer-encoding:content-type:organization:autocrypt
         :content-language:cc:to:reply-to:subject:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=a87j8swmEQc4k8uOXUNzJXiAtCjtnQaei+ph1mC40T8=;
        b=jnq4sBEm9g8L7EtloVMyA3CBaWuYVpItTOxhtUM1+jBL3mGnwnRbQLozx+BWt3OQAw
         igTZAb5Bm/NSOz3fSiNmZjx0Uh85SStemGZJHYOemJc5eHLCmlAHv/vAB9WK0lw6yo2H
         JGQwrcy3cqA0TX6M44sz758OYO9YmTZJLFMyjQ0TLwfSC7/RHmD1ADy+EoCs9RV170/I
         SLcslXHWIcbYldi80DnDHLipHlaZ+omtwdD0HfvDdxkiL35p2FlELR/pBcIHeWRtFeAB
         PVzlE61ln+3lExmZv9+X5NhRuWgiFgP20UghNOc+mDX6pII4rBpdoM6vS+ScA2/HtqVo
         DFNA==
X-Gm-Message-State: AOJu0Yzse18UqocDBOnBz2Ux06lP6c8IpeILtRwWIcf5Xiss/DCuMS+C
	s2iZ5dXlwY054t24RPQ98VUlNyIuNQCO0zbRKzEsZUz/463yoW7/IojwiWlMwCbvkOh4n6kiuYM
	db3Rs
X-Gm-Gg: AR+sD121lvpxJzbKKOoVdz/NQN22avO6NNp1WIrj1gFO0tNMEKAa3RX8QmbkVDekjje
	WSmnk/bd1W16ON/YQPoc3tdZ7LCosLu3FR9crliX22TqOjB36DNtVTLtW89rk8vgTEcrwECTEVg
	Y4bXwap5hl2bz3yU71uOfeRsbLn4qfC69I4/fjA3vBZu8AgKpoCEtZ+HhVr2q47raSXrR6CWJ2r
	jOJ9sppr8DYj9UX4Lu+9VVjKemyE3ZIB/k6NmEy4M3eiBfUzj7Jgq4YFiae203xq/gNAh6fsY4P
	S3bElCmzn0JcxRQ0XSYdHIMTJRwXHGTb+E46kb+J94nsRQgvmUqjMfBVZsPrSZ4Xog8U7piQdZ3
	l/rHgY6L5JAk3xkFWlVQLmQONrmU5ZsmvzCppx+uNG7wdCfiib0xS7WT6Q7MSTnBZeXxZ2hBSnQ
	kfRgF0k/YDpLsox3TLOaoEp7F/xiCIUdNDgBVRh7keox5SxFXQ0kCMdqfZGUMqpf60Xhz+c2VYw
	5WTyEoCeIswrNvuUAhhYKDL46numvlrSymCYFblVA==
X-Received: by 2002:a05:6000:240a:b0:47f:8558:8ff4 with SMTP id ffacd0b85a97d-47fd72ffa87mr374052f8f.54.1785513584059;
        Fri, 31 Jul 2026 08:59:44 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:6c49:d2f1:f94:1fb2? ([2a01:e0a:106d:1080:6c49:d2f1:f94:1fb2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41e2cf1sm6118853f8f.10.2026.07.31.08.59.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 08:59:43 -0700 (PDT)
Message-ID: <7db3a138-facb-4132-aed8-8e8dcd3bdf60@linaro.org>
Date: Fri, 31 Jul 2026 17:59:43 +0200
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic ARM64 DT updates for v7.3
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

Here's the Amlogic ARM64 DT changes for v7.3, contains some overall
indentation cleanups for the Amlogic DTS, some new features support
for Amlogic A7 & A1 (clk measure), A9 (pinctrl, gpio-irq) and some
fixups for AXG to only enable PCIe on the S400 board.

Thanks,
Neil

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm64-dt-for-v7.3

for you to fetch changes up to 7f1d0cc86cb70fa550163b6f70fd1d484c03218e:

   arm64: dts: amlogic: meson-axg-s400: enable mipi_pcie_analog_dphy for PCIe (2026-07-20 14:31:02 +0200)

----------------------------------------------------------------
Amlogic ARM64 DT for v7.3:
- Amlogic AXG fixups for PCIe and NAND
- Overall indentation and whitespace fixups
- Amlogic A9 Pinctrl & GPIO IRQ nodes
- Clock measure nodes for Amlogic T7 & A1

----------------------------------------------------------------
Jian Hu (2):
       arm64: dts: meson: a1: Add clk measure support
       arm64: dts: amlogic: t7: Add clk measure support

Jun Yan (4):
       arm64: dts: amlogic: meson-axg: Disable nfc node by default
       arm64: dts: amlogic: meson-axg: Add missing nand_rb0 pin to nand_all_pins
       arm64: dts: amlogic: meson-axg: Disable pcie_phy node by default
       arm64: dts: amlogic: meson-axg-s400: enable mipi_pcie_analog_dphy for PCIe

Krzysztof Kozlowski (1):
       arm64: dts: amlogic: Correct indentation and whitespace

Xianwei Zhao (1):
       arm64: dts: amlogic: add some device nodes for A9

  arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi        | 140 +++++++++++++++++++++
  arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi        |   5 +
  arch/arm64/boot/dts/amlogic/meson-a1.dtsi          |   5 +
  arch/arm64/boot/dts/amlogic/meson-axg-s400.dts     |   8 ++
  arch/arm64/boot/dts/amlogic/meson-axg.dtsi         |   5 +-
  arch/arm64/boot/dts/amlogic/meson-g12b-a311d.dtsi  |  38 +++---
  .../boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dts |   2 +-
  arch/arm64/boot/dts/amlogic/meson-gxl.dtsi         |   2 +-
  8 files changed, 183 insertions(+), 22 deletions(-)
