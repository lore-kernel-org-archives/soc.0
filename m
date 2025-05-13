Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C3F27057D
	for <soc@lists.linux.dev>; Tue, 13 May 2025 10:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747131952; cv=none; b=r9JYtSoRVLA4+JCJilj1Oi7AtKCA8RpbqESH5o3ECQaKOC0LJKI13tUzap5Wpu3vb8tdowMromgR34t1eIKLxfJrhzHR0ubZxrMcsB6ZluZZMUALZNvB9Py7ZK/GVmDNGU/mBFk7yBlYPND5zMGrILef1pH5qbIc8UkE9mdY5mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747131952; c=relaxed/simple;
	bh=MfwSwymuW5o3cDyznvJVzkYRE4aYTDBp+a6iR6rCP8E=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=CFf9LLaqsBM/QA3sfTPa0a5GtzvboqklW/5BbQGDPUNeJkjY80wgIN0j8HVtJ/R+hCoqGZTcXomHFvXPNJHCD9dSRhe23k/RSDMgjO8UaILv9cUrc9OI1SMdS889NB6tyxY7bq5DMbJu8sDkMulb5W2yZ6jMtfrTwQahgi3M6dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w6aLuM6T; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w6aLuM6T"
Received: by smtp.kernel.org (Postfix)
	id E0B64C4CEF2; Tue, 13 May 2025 10:25:51 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AD101C4CEF0
	for <soc@kernel.org>; Tue, 13 May 2025 10:25:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AD101C4CEF0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so55300825e9.1
        for <soc@kernel.org>; Tue, 13 May 2025 03:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747131949; x=1747736749; darn=kernel.org;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xOAW4/y1I7dlyrGJJ9emafCDdB62k/71A+ZzQQXgDR8=;
        b=w6aLuM6TvvxbTYrkBsXaPq1dNXkz1zGjZ+8drRQQGzJjK0Hn2EMppPP1CPcHGrzFgv
         mbZS45uYIRaCdF7f3z6sr7pSo0mlU0qcQUm9MfAvPaYIIPCH0w3CrnqbG8FP7lnqN1G7
         RCS4NaJU/t4kRoO0lc9LsLB1FA4/PY7ZN0ZlxnxyfdAyXcWiMqzq/D6RwVWkVEk9WEK6
         7sSCu1jN21/D6ZIAvO4XyAZ9KD/0dkK9/Wvziie2OBOJQh26sSzgNKWzvWEKs851fgyf
         62wGZrEVLgudAYIebPKYKLAJSD6r2e5Htt94XW1PIIapSSirpQ4G31ZWhkpls0xpPPWX
         HEMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747131949; x=1747736749;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xOAW4/y1I7dlyrGJJ9emafCDdB62k/71A+ZzQQXgDR8=;
        b=bRIUihJBc5torKYPB478wB8rAjZri4t50lOgyzZ1dLeUHCsudMmnZ3+/m4gpVrwBcb
         LEJlhkFPSRJGYaBFjBtRwNcprq5GSNsmsH4LBWSfo6NGqNrv9uMecxs4YRF7Ucogqb6i
         74PcH5kaJusiM4R6HvLvVhkWoL3HvSmCoe6U29LTG9N/VKpBTg15S4pUfcs+uIVmZokw
         I2KXPS3ldCWZ5wVX5X/fPho5eHNGY12Hweudo4L06oNg38jUMMIF9HIX2BBkBs882TUF
         LMRejvlJLF+pilkxXZLVLOigNu20PCC3vKR9BK2DeQy0ZrtYQmb1nPjK3710eKmHK1Hb
         cXCw==
X-Gm-Message-State: AOJu0YyOrySgvlISgXG9fakCu5uubDYn3nN3uSeHD2R614+FYSowiziM
	ZifxrhkxXS+UvosXE01+kplA5g4Ztx54IblHLJdUMUijReB/AAOXVokcbQThmA6p3iHRheUQAWA
	445c=
X-Gm-Gg: ASbGncs0/naLFlysQIM2HYcpveXewHI7Z/aMSOtK7PtjbprXkMtvd8eJ1UGuColrRDE
	XIM5QD6fTjstLrxZ5Nmj0jalX632IdfTxXMS64M4sjk+d3ni4fb3oodbK0Qd+uJhe317aOgEAeI
	+WHK8kDV6CjOvWSwSL0WcdXARWPSN3b7p1jCEMiVSkyjGvuQRtPgZTaxslIyvG2FiQ6TM7q1lTM
	sAFbfIeORS+9typCLR5lrG9ty/vPlPHB/OyKOXq8wJmj0yU6OTYvn+vSIqFYD7Ma0nIWDeXuKd1
	5i/zfEzIqObXcmRYENoyADKIHkdP9JowFilcD8OFXxrZlIYSGlrUowCM4/oIoQWKFLnKLuY4rdm
	6Akm12uie0whbHllKiNvbRXM=
X-Google-Smtp-Source: AGHT+IER23BQik5Lx2zoekeA+pdHljoqfbrl4jmtmT7/sMAlqJykMtKsTIOYUE8EH690KnhP8BAxRw==
X-Received: by 2002:a05:600c:3ba8:b0:43d:300f:fa1d with SMTP id 5b1f17b1804b1-442eaa9ba15mr37237455e9.31.1747131948908;
        Tue, 13 May 2025 03:25:48 -0700 (PDT)
Received: from [10.61.1.139] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd3b7b83sm198972445e9.33.2025.05.13.03.25.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 03:25:48 -0700 (PDT)
Message-ID: <04908842-4c55-44a0-b74c-3aca82a1f204@linaro.org>
Date: Tue, 13 May 2025 12:25:47 +0200
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] Amlogic drivers updates for v6.16
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

Here's drivers updates for Amlogic SoCs, refactoring the clk-measure driver to
move more structures to const and support C3 & S4 SoCs.
With Philips' ack, I also picked the A4/A5 reset controller bindings.

Thanks,
Neil

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

   Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-driver-for-v6.16

for you to fetch changes up to 87b480e04af45833deb5af1584694b0077805ea6:

   dt-bindings: reset: Add compatible for Amlogic A4/A5 Reset Controller (2025-05-09 17:34:10 +0200)

----------------------------------------------------------------
Amlogic Driver for v6.16:
- Amlogic clk measure memory usage optimization
- Amlogic clk measure support for S4 & C3 Socs
- Amlogic A4/A5 reset controller bindings

----------------------------------------------------------------
Chuan Liu (6):
       soc: amlogic: clk-measure: Optimize the memory size of clk-measure
       soc: amlogic: clk-measure: Define MSR_CLK's register offset separately
       dt-bindings: soc: amlogic: C3 supports clk-measure
       dt-bindings: soc: amlogic: S4 supports clk-measure
       soc: amlogic: clk-measure: Add support for C3
       soc: amlogic: clk-measure: Add support for S4

Zelong Dong (1):
       dt-bindings: reset: Add compatible for Amlogic A4/A5 Reset Controller

  .../bindings/reset/amlogic,meson-reset.yaml        |  22 +-
  .../soc/amlogic/amlogic,meson-gx-clk-measure.yaml  |   2 +
  drivers/soc/amlogic/meson-clk-measure.c            | 461 +++++++++++++++++++--
  3 files changed, 438 insertions(+), 47 deletions(-)
