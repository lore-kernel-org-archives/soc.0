Return-Path: <SRS0=1Rsl=IA=linaro.org=neil.armstrong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF204C35274
	for <soc@archiver.kernel.org>; Thu, 21 Dec 2023 10:11:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A6268C433C9; Thu, 21 Dec 2023 10:11:11 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C648CC433C8
	for <soc@kernel.org>; Thu, 21 Dec 2023 10:11:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C648CC433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3333b46f26aso516256f8f.1
        for <soc@kernel.org>; Thu, 21 Dec 2023 02:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703153469; x=1703758269; darn=kernel.org;
        h=content-transfer-encoding:organization:autocrypt:reply-to
         :content-language:subject:cc:to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dMObNTLbiCqgZOU19vHINWmmp+QWstCS1LGacoiIgn8=;
        b=i54Io2j8DK0tSnLFR9jJGFJ6x9VZnMHIuJd6kAHhIUlKlMCJCV/FW+nIMFDrkO+jjV
         JZ8XJJEi2olOB2zdtpqoh0/FxW/dmSLxp4tjXvI6AAwCesqMKbF+RqqxGqGphpeegdeH
         UuFF1G45DYSpu0ooNJ/pdoMytiAMW5WPQVwKpf3ElYqsF+87H28XLoF+pUJTo/e+LfEk
         M2KfWA6ehcXZ0uuRVroF+VXQLaAz/jLhY+xDIUmVtmWGjDhfhbpZR6axRrq+CYNytYAF
         G54gxXbl0eeUXliZgQUcfHPO3PbmC4ZrCjpoHMEETvaISN2+A5AfzvlveVX8XUKQWiL+
         Vcfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703153469; x=1703758269;
        h=content-transfer-encoding:organization:autocrypt:reply-to
         :content-language:subject:cc:to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dMObNTLbiCqgZOU19vHINWmmp+QWstCS1LGacoiIgn8=;
        b=O5MzH9WifH+IqDVt4fFsVYl1N99h+vKGrBLrAxcY62agMqcNOXqGVUJvQC7Ia9GNnx
         uB6E4Bf3tLTY6ffBtpsMYQdce+VIjyHVmvVRTK3RGIDmc1SVtcFYwp9SxO+XAj06krEF
         AHBlQRIjiOxOGTZ48rFmjClYc/1hd+2r27IHZULHCQKEuwtGHec1WMRniQmGQw8gHMHF
         jGRtb0SLeAmFmOJMmxxE+U4Qb65H8l3tQADc9d1z5JBF3R7YzshmtHY6wF+1Cyfv9Krp
         BFUl4sVwRa8FxdvrNb+JlFoK8onrkcFL7RbjunmO3K9dBmOkXk7vDHQjs5guxQJ+OtGD
         XQBw==
X-Gm-Message-State: AOJu0YwDChsukNumxC8mmyHRQWPtWI9lHFmvnWK4WPQ2ywrl8atU78ka
	yCDvbc62eAu52umzoEG7VnLWSlsaJsQDiwgnqPDvWFJK
X-Google-Smtp-Source: AGHT+IGMxxb+i7hFixEKwp+Jxq272QxhvTL0g3UKNL2dF9t+9fE7DPps2Q2XKWhpik6Y6iE0+E7cvA==
X-Received: by 2002:a5d:540a:0:b0:336:5ad7:2091 with SMTP id g10-20020a5d540a000000b003365ad72091mr513219wrv.143.1703153468819;
        Thu, 21 Dec 2023 02:11:08 -0800 (PST)
Received: from [192.168.7.29] (679773502.box.freepro.com. [212.114.21.58])
        by smtp.gmail.com with ESMTPSA id c14-20020adffb4e000000b0033687f3b9b5sm1069591wrs.93.2023.12.21.02.11.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Dec 2023 02:11:08 -0800 (PST)
Message-ID: <a987f881-1c23-4528-9cb1-e5a875b7e7a8@linaro.org>
Date: Thu, 21 Dec 2023 11:11:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] amlogic drivers updates for v6.8
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

Here's a couple of non urgent fixes for the meson-sm drivers.

Thanks,
Neil

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

   Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-drivers-for-v6.8

for you to fetch changes up to d8385d7433f9c7d718448465e30d6b8c1207b59f:

   firmware: meson-sm: unmap out_base shmem in error path (2023-11-27 09:17:51 +0100)

----------------------------------------------------------------
Amlogic drivers changes for v6.8:
- meson-sm: unmap out_base shmem in error path
- meson-sm: use dev_groups attrs for sysfs entries

----------------------------------------------------------------
Evgeny Bachinin (2):
       firmware: meson_sm: refactor serial sysfs entry via dev_groups attrs
       firmware: meson-sm: unmap out_base shmem in error path

  drivers/firmware/meson/meson_sm.c | 19 ++++++++-----------
  1 file changed, 8 insertions(+), 11 deletions(-)
