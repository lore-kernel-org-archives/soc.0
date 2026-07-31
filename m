Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF4C441614
	for <soc@lists.linux.dev>; Fri, 31 Jul 2026 16:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785513628; cv=pass; b=BU4r9Lc38lE/ho1hjHUclBURmLodtJn58+muixakkjSvcvq5mcnKX0gfMpMU3LL9ehFBmiUu1bLetDaYaAC9VG6fksefgNV5Bmb7qDTzUkY2RdgbCComoabAIwiLK4ZjU6OFGWLFsaCQ9YDPxhalQmnbsHokojx20qN3ooq3WKs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785513628; c=relaxed/simple;
	bh=txb36siF8sm6sVeEG0Lu3bl2nTRTPMohG1/kxRrSuIg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=O6NLq3iENNLwgSonquH6Pb2BC+NwbD72OUMa+d2hGnvbdCztWcUxPzl/UW4YBnJNi2qzMCTBK32iZgcZClkCMKhh+Nef9aGXUHCIfl46VQKUBTx/P0rxb8tSIQKhKjwUMKLIhXgEnOotkV8vE6CDaf6urrN6hbGGo1pho/i2vec=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YUaNFmFN; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YUaNFmFN"
Received: by smtp.kernel.org (Postfix)
	id F0EF11F00ACF; Fri, 31 Jul 2026 16:00:26 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=209.85.208.42
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1785513626;
	b=leyMkHAZZjW/RpqWcSJBgSpX4/nS0yugbimX2OokRDWdHzfvt4AVC/fiuGUeFzJqDQVP
	 ujECnPDrWJhUfOV+KoXlvis5EWjpl9XLBgqQz+AgZtUkDfqxYigCvfq9EE8bcY9F49h59
	 neFRyCF7NvSQJhdXVfT2egq1gKFmILP5AkFJ6Jj2Z8B4Xk7cBBCnaxV8HDt7WQISRR8po
	 ftiM//jVyZ5w9kMBlwB7GQ16Yxk1zQaQ0UkjjZ+7dwe3TTvghVwYompskCYAgz+aZ0RjA
	 zdf/gNsBu5e1v0cJJ9ksBnXKFjXCp2A3SEPQQPW4OBDyIB5VI8FnE61F/cBP0kE+D8Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1785513626;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:From:Subject:Reply-To:To:Cc:Content-Language:
	 Autocrypt:Organization:Content-Type:Content-Transfer-Encoding;
	bh=SLNSgMQhVqM3POys4Jpc5TRM2LSV5osJzadKzZ0lcT8=;
	b=CKg+MMriiNqABnGDygCN4jlIARks5aLWymP6gsf9FQUXlu763UEKtcPBMqNGxPyBgm5w
	 yZ4qPPY7HHBnCiiMievbeIr8ve16++EM9e+wOkq4GyiyEkq0ypMMoqy98E4Nvz+KpvSEq
	 dKo92j9mH9Q3sD6Z57XEKTlurL7xD6Am/7Wy9E98A3IFv7HOIkr/xzmaMpYIO4Js5PLyy
	 ExoEvjVR42jg2Q0IZVFZvn6xnlfstZp8LYD63Z6VdZx5R/zt/h5VoYvjXGH92Rh0yNR7Z
	 /jwkO/7NEuOSL7Syg3R2Dsp7PYaApfD8+SQP7wfR/Up1C62ypyMZlH54Pbpz4b38fVA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=YUaNFmFN;
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	arc=none smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5685D1F00AC4
	for <soc@kernel.org>; Fri, 31 Jul 2026 16:00:26 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=YUaNFmFN
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 5685D1F00AC4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6a0a4a28cbdso622782a12.3
        for <soc@kernel.org>; Fri, 31 Jul 2026 09:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785513625; x=1786118425; darn=kernel.org;
        h=content-transfer-encoding:content-type:organization:autocrypt
         :content-language:cc:to:reply-to:subject:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SLNSgMQhVqM3POys4Jpc5TRM2LSV5osJzadKzZ0lcT8=;
        b=YUaNFmFNIj1zR7xbsKHXJph+rl8ayk2q9c2PTgfKIRNNZ8uZpxbmbIec5nss+QxGIE
         rdUdx5LfCL9/B9dMFbtQ1qdolFt9iZ2EpqAoPZ/6RKGtpk59B/5GswMfkiA1Gg4Pg3of
         /Eil9o4GvCSmQ6j6aSt0qX/3jjUu36nCr9ML4vvG5b6TZJIx8cZ2Tn/0B/U34RjHKWEn
         W3oQHTX84tujxSDYmSsx7KYG9vUyXZ3SsJJ2Fkqoc95y12sw8U9rU/GPPFW6ag40E5SU
         4xCENRaciCMV0qJbSJ4wsqkeEVh9c9DDLf4q4siNNR8W2bOx7QaS9RQq8PMZiSE0RXOp
         0xQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785513625; x=1786118425;
        h=content-transfer-encoding:content-type:organization:autocrypt
         :content-language:cc:to:reply-to:subject:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SLNSgMQhVqM3POys4Jpc5TRM2LSV5osJzadKzZ0lcT8=;
        b=Dg7YqGOCyHygVurDueVv6p8TCSuAQ6A/p47AUfMIZbhIXGBFaOtzv+a+8K06n/8hxX
         IC+QK0Yga4d3TmJci1wB0umPWhRLe3VAbsLfIiLgJ3pTYAMwXRPtgdNio9r5YWAeJ/7K
         TnjYpsBA/tJw9SUf4toEiECI7CIN6xTNwBtnDiXkTnZyLmXaEJS6fynl6RnOJ5m3tZNJ
         dQLUDv243AItKlekx/rsGH3tUq77ciiVq5lBr0sTPwGEgpyS4kKNIVPib+SiT4/71J+z
         foLmzzoSfrXPjFwVyCS7KrOEktkQhQFvODpW3iVR48s4rsWN8CJZ2/e+TMWdhVPMcjhh
         uwbQ==
X-Gm-Message-State: AOJu0YxXXCTMFnhFjaKggacM0hOOqS2GIsNUmsEJdW5eTpOYikPi9WFV
	GtXO7hpU9DaUGdJtvlRDCtntSRx8ckeEfnmrodBdUlebgHLGtduxPQbvYuv/A6PJL3TIkHZtHEh
	RCgOV
X-Gm-Gg: AR+sD13VvHLbbKN/ItTtmj7aNY+vowC0Sbgl0LWGwDeX6QhEhiX7qZQZbg8PMHB9rxl
	yrDfjWr/sVH9Ph+VUu4zWQUeckNBhyeV8kJrbaMor3sB3HC8otFIYYGZkGax0W09/RxPVJOLHgy
	7mdgUKpOIZoppLpEMmErBTYqM8+ZNrI45BQGw5lDXGrJlPwOps0M2ejg1kVLOFvItQowMa+dWoc
	0OpJtJz8Ti5TeD9Ni1drlB3P7j+CBXjRNm04poBwsayC1mPI5a3Hae5yY6j2gALwTwRCeetGNPp
	lnuOEWoSVPlaAkMYAfsbbopy6bFCWIoXGGmhgkBVvm5SWCzxJh2XgVJOstFPgA/mPLTmsXoHoAm
	pmSg8ycPR9nyCMi+Hp2hqE3i9/L0ZnJFsMfGvKBZ0WfaXIFjF2YYmGI6e4kNx69Osp6EkS515l8
	lxtMQZ8+20BAe/a5do7cQob6e0UuEjY5k26eaggslAk0DwHkcpPZgJDe1RQfotUs3QbvmPV17mt
	zeAawpsGAjrKezLgh3CWCRjBvGBGL9hytGJPigj6w==
X-Received: by 2002:a05:6402:5305:b0:698:52b4:c2c8 with SMTP id 4fb4d7f45d1cf-6a0a7d13b50mr95707a12.34.1785513624522;
        Fri, 31 Jul 2026 09:00:24 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:6c49:d2f1:f94:1fb2? ([2a01:e0a:106d:1080:6c49:d2f1:f94:1fb2])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a09c6615a1sm1894955a12.27.2026.07.31.09.00.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 09:00:24 -0700 (PDT)
Message-ID: <41698506-1585-4b8d-930e-91a79b58b833@linaro.org>
Date: Fri, 31 Jul 2026 18:00:23 +0200
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] Amlogic drivers updates for v7.3
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

Here's drivers updates for Amlogic SoCs for v7.3, mainly fixes and new
SoC support in the Clock Measure driver.

Thanks,
Neil

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-drivers-for-v7.3

for you to fetch changes up to 67481152be2ec5de3529664c82054b43d6d4b9f5:

   soc: amlogic: meson-clk-measure: remove debugfs tree (2026-07-03 11:52:17 +0200)

----------------------------------------------------------------
Amlogic drivers for v7.3:
- Clock measure debugfs fixup
- Clock measure support for Amlogic A1 & T7

----------------------------------------------------------------
Jian Hu (2):
       dt-bindings: soc: amlogic: clk-measure: Add A1 and T7 compatible
       soc: amlogic: clk-measure: Add A1 and T7 support

Pengpeng Hou (1):
       soc: amlogic: meson-clk-measure: remove debugfs tree

  .../soc/amlogic/amlogic,meson-gx-clk-measure.yaml  |   2 +
  drivers/soc/amlogic/meson-clk-measure.c            | 286 +++++++++++++++++++++
  2 files changed, 288 insertions(+)
