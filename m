Return-Path: <SRS0=T2Xw=QD=linaro.org=neil.armstrong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 338C0CD5BC0
	for <soc@archiver.kernel.org>; Thu,  5 Sep 2024 12:47:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E3AE6C4CEC7; Thu,  5 Sep 2024 12:47:49 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 419B7C4CEC3
	for <soc@kernel.org>; Thu,  5 Sep 2024 12:47:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 419B7C4CEC3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3787ddbd5a2so408349f8f.0
        for <soc@kernel.org>; Thu, 05 Sep 2024 05:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725540466; x=1726145266; darn=kernel.org;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Nrk4B/qGNUdaCVWJVOZf6rns7BLg+A0NUX/JpMGGFeM=;
        b=YWWagRyXb4I0zwKAyutusI+6V2LD6Ogd1wyrgqkH6ovGnj9+PsWtW8nU+edVZcRuju
         U1CVK80pe3bI7Cul8eT37e7wQybvVKlp9lRo1+UC/jCJmUl0PAxD+LDpMy+fBU7id4VM
         +UFW9J6nM3vpul0V+gAZmZoyr5M+8Tvz2qPO03fMQXps9v4EVAuvOKirONEhWo0pXFH/
         bpAb9Vhrm05/6+sHb3nPo9AZNpbgiA3jiDOfoMEyf1ySEHqiGkpXLdVnU1yHsaJsTaUt
         b5Mg1fLCXetNE4IEctLWeykHNUfdAPSmFXF9z0vn1RFzrOTKy739b5OnHymiqz3tVWKY
         khqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725540466; x=1726145266;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nrk4B/qGNUdaCVWJVOZf6rns7BLg+A0NUX/JpMGGFeM=;
        b=Qnqs0THWAccf+7B0XVwnmydSx+TK5ZTHw0EyNZNFWITZ9V6U/WJ4yGllhuHxcoNFWL
         c+x4idgH+QsDnyKXJ2QZ9dGBlBpNPNMXWY2ejEcshh6mI1XzvGxvsd7ReTn4UxIiYwog
         if+XAp3a/nV1OSVeiP+lrguYlDtT782VrRB1J134RlUAPgfhivpBoqbIahXR3teXHFnE
         m7dS0zjI4U/UKWyAB6eNcxUZ/cJJqDN/2PuTjvSAZdf0DMjaFo4TC+aByYRAJ83WhyuR
         QV+O9icEWeKNHbTCXJi3XnwcpX/IvtzsVLOO3ODP9s10q5Lhk5MV4Au8EfuvDN7qx59Y
         whiw==
X-Gm-Message-State: AOJu0YxxEOwXzB1Twn3nJPLz8Y7GbR8ysMNzJPIxiwbpwr00wxI05Qw7
	tXaSSjoEdg1nOFVldTbRz3XtRAR2uNE1nTqpsX47mncDaASxElIr+BcxIUizFq9iBIN/XKL8LtM
	n
X-Google-Smtp-Source: AGHT+IHf0iYbRCgb9G5+xSIhuBBVI4n86LROgBs7UgYF9s8Ff3uqlS3m6Zcht7BRO/IuEFPxKw3ISQ==
X-Received: by 2002:a5d:4f92:0:b0:374:c2b0:6fee with SMTP id ffacd0b85a97d-374fa052da8mr7727620f8f.59.1725540466094;
        Thu, 05 Sep 2024 05:47:46 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:4a45:fd0d:4bfe:dc52? ([2a01:e0a:982:cbb0:4a45:fd0d:4bfe:dc52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374bcdef309sm15002876f8f.71.2024.09.05.05.47.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Sep 2024 05:47:45 -0700 (PDT)
Message-ID: <577ad7fe-19b1-468a-b994-573855493fd7@linaro.org>
Date: Thu, 5 Sep 2024 14:47:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic drivers updates for v6.12
Reply-To: neil.armstrong@linaro.org
List-Id: <soc.lore.kernel.org>
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

Here's a couple of new SoC IDs and meson-gx-ao-secure compatibles.

Thanks,
Neil

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

   Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-drivers-for-v6.12

for you to fetch changes up to 009ff80bfaec1aa3fa48bbe5e2903c95931a6f37:

   soc: amlogic: meson-gx-socinfo: add new SoCs id (2024-08-20 17:27:27 +0200)

----------------------------------------------------------------
Amlogic drivers changes for v6.12:
- Support new Amlogic SoCs in meson-gx-ao-secure & meson-gx-socinfo

----------------------------------------------------------------
Xianwei Zhao (2):
       dt-bindings: arm: amlogic: meson-gx-ao-secure: support more SoCs
       soc: amlogic: meson-gx-socinfo: add new SoCs id

  .../bindings/arm/amlogic/amlogic,meson-gx-ao-secure.yaml | 16 ++++++++++++----
  drivers/soc/amlogic/meson-gx-socinfo.c                   | 10 ++++++++++
  2 files changed, 22 insertions(+), 4 deletions(-)

