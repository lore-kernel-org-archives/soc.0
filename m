Return-Path: <SRS0=1Rsl=IA=linaro.org=neil.armstrong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8148FC35274
	for <soc@archiver.kernel.org>; Thu, 21 Dec 2023 10:12:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5AAB9C433CB; Thu, 21 Dec 2023 10:12:40 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4FCAAC433C8
	for <soc@kernel.org>; Thu, 21 Dec 2023 10:12:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4FCAAC433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3368c5c077fso116557f8f.1
        for <soc@kernel.org>; Thu, 21 Dec 2023 02:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703153557; x=1703758357; darn=kernel.org;
        h=content-transfer-encoding:organization:autocrypt:reply-to
         :content-language:subject:cc:to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Y9lT5xpj6JS/6F8fnjNjfQNyipqb+Fp7JAcIAt8M+VE=;
        b=l3Aa2d4S3SHu7AYJn7yP9FgMThQIV7Q6mv3EGtVGi7hW5t/qLuFmtBagi0lbtOqQh4
         HrlUpFdUHoov9yY7SoTY110osZIy6u6gCeN+6q+Yd/ug9SQKzrPU9MFf4fyL7mT3PvmW
         v/hHpo0Dp+s4slndf2uz8O4w/MT36U6Z3NIkJoQws2mLrWJpkZOr4/850xKIPHTFwsSL
         BPdoP53OzCNg6ZY4RF6abj2RcTGgUK1SQrzrk5IehN+ILwfdYLzfNg/+D9FVzkowARH2
         UuIENBtFaxSRlpK3gaEiYgAXgk3swWbsMd3qSS3UN7BhMaWFsSyFkCzSMGdqOZjHs80U
         a3UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703153557; x=1703758357;
        h=content-transfer-encoding:organization:autocrypt:reply-to
         :content-language:subject:cc:to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y9lT5xpj6JS/6F8fnjNjfQNyipqb+Fp7JAcIAt8M+VE=;
        b=jL76a6jKBhg/kAkzELMTKx68Rp5Plz8+A2UsAvxD41FvPkk4llfETl2Rp0GnF7iHsS
         vuXfbYOT3pzdX7fJrgUt/mpe6N0VM3kCj4o/KxFukZzGGYJGaD04KxCTdRhHtWunPmma
         KvoTX1/L3LXRMzu30aBg0LPPS99SZrD+dSywxdWbTHhZqhOdq//tC3L7XJl7XwY4W9Hk
         cyHbpap8OQyYG661MEhCsZbPZqxuUyNcgKm5q17Ad+UGBkHkILEcW7Qvh2+Kdn552WNc
         UTTKpNr/uV3qif5umNJpk0ElmmS6yAPCdZ3nts9Okg9UVvbn2Ogzo9T7CjHMrafasAf2
         NN5Q==
X-Gm-Message-State: AOJu0YzgtpqdHIJBSgJFnbQFZzOUmt8TwUsDq7f6cJSWoJ0Glxl2oxN1
	pV/u7LtXQayCEuXdW81eoFbcUw3UXgE6NoNlqEZ1abtK
X-Google-Smtp-Source: AGHT+IH5n6YRER9010t+TIRpLgl9P8IdXPNwqiRhtPfjckIEilGzVXUIU/XQ6SlTit79n20953Ul1A==
X-Received: by 2002:a5d:66c2:0:b0:336:8c0e:cede with SMTP id k2-20020a5d66c2000000b003368c0ecedemr80744wrw.214.1703153557472;
        Thu, 21 Dec 2023 02:12:37 -0800 (PST)
Received: from [192.168.7.29] (679773502.box.freepro.com. [212.114.21.58])
        by smtp.gmail.com with ESMTPSA id c14-20020adffb4e000000b0033687f3b9b5sm1069591wrs.93.2023.12.21.02.12.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Dec 2023 02:12:36 -0800 (PST)
Message-ID: <e38724be-c9f0-4916-bfd0-d20b316db2da@linaro.org>
Date: Thu, 21 Dec 2023 11:12:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] amlogic ARM64 DT updates for v6.8
Content-Language: en-US, fr
Reply-To: neil.armstrong@linaro.org
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
Organization: Linaro Developer Services
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Here's a set of Amlogic ARM64 DT changes for v6.8, with cleanups
and a set of new HW support for the S4 and C4 Amlogic SoCs.

Neil

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

   Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm64-dt-for-v6.8

for you to fetch changes up to eb54ef36282f670c704ed5af8593da62bebba80d:

   arm64: dts: amlogic: fix format for s4 uart node (2023-12-19 10:24:52 +0100)

----------------------------------------------------------------
Amlogic ARM64 DT changes for v6.8:
- DT cleanups
  - s4 uart node
  - drop redundant status=okay
  - minor whitespace cleanup around '='
- Watchdog nodes for S4 & C4 SoCs
- Clock, I2C, SPICC, NAND, Ethernet nodes for S4 And the AQ222 dev board
- Add EEPROM on the jethub-jxx boards
- Update of the amlogic,meson-gx-hhi-sysctrl bindings

----------------------------------------------------------------
Arseniy Krasnov (1):
       arm64: dts: amlogic: meson-axg: pinctrl node for NAND

Huqiang Qin (2):
       arm64: dts: Add watchdog node for Amlogic C3 SoCs
       arm64: dts: Add watchdog node for Amlogic S4 SoCs

Krzysztof Kozlowski (2):
       arm64: dts: amlogic: minor whitespace cleanup around '='
       arm64: dts: amlogic: drop redundant status=okay

Neil Armstrong (1):
       dt-bindings: soc: amlogic,meson-gx-hhi-sysctrl: add example covering meson-axg-hhi-sysctrl

Viacheslav Bocharov (1):
       arm64: dts: meson-axg: jethub-jxx add support for EEPROM

Xianwei Zhao (3):
       arm64: dts: amlogic: add some device nodes for S4
       arm64: dts: amlogic: enable some nodes for board AQ222
       arm64: dts: amlogic: fix format for s4 uart node

  .../soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml  |  33 ++
  arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi        |   6 +
  .../meson-axg-jethome-jethub-j110-rev-2.dts        |  14 +-
  .../meson-axg-jethome-jethub-j110-rev-3.dts        |  12 +
  arch/arm64/boot/dts/amlogic/meson-axg-s400.dts     |   5 -
  arch/arm64/boot/dts/amlogic/meson-axg.dtsi         |  23 ++
  arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts  |   1 -
  arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts |   1 -
  .../boot/dts/amlogic/meson-g12b-bananapi-cm4.dtsi  |   2 +-
  .../boot/dts/amlogic/meson-g12b-bananapi.dtsi      |   2 +-
  arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts  |   1 -
  .../boot/dts/amlogic/meson-g12b-ugoos-am6.dts      |   1 -
  .../arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi |   1 -
  arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts |   1 -
  arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts    |   1 -
  .../boot/dts/amlogic/meson-gxbb-vega-s95.dtsi      |   1 -
  .../boot/dts/amlogic/meson-gxbb-wetek-play2.dts    |   1 -
  .../arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts |   1 -
  arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts |   1 -
  .../boot/dts/amlogic/meson-s4-s805x2-aq222.dts     |  60 +++-
  arch/arm64/boot/dts/amlogic/meson-s4.dtsi          | 360 ++++++++++++++++++++-
  arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts   |   1 -
  22 files changed, 504 insertions(+), 25 deletions(-)

-- 
Neil Armstrong <neil.armstrong@linaro.org>
Senior Software Engineer - Linaro Developer Services
https://linaro.org/services
