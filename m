Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457534BD108
	for <soc@lists.linux.dev>; Wed, 16 Sep 2026 10:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789553393; cv=pass; b=ZZ1vyk5qzIKLF/6WB2vTPENnTIrVEcLDHA3GqJm5MZ5dIDcHvDDW2Mrk6ImR8ziie7L9Ke0aTTqmnGeLtDgsbclJo0HT5szjVwSRHWHoEna3zajHUr8XnvW7swfcn7ljYGlNVbT68RED1gzWZSTKaC6j0fhiKqkPkYCvLws7gYs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789553393; c=relaxed/simple;
	bh=Od6sUkRARDFcDJ7U2rdul+8wgmOhxH5va5NWIxJPQpg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=Mu9ONxQMI0x13N7SGG446h45l3XlxKy+9J+qELumTYlNGAXVxm//nM8HtSoC+/IuzY67/DTHZr+0xz+JpL7mQQYIWttcKhL32ZSL4VS9sUm6btLs9Zu+XtlvWNzpjDA/raoC41BqTLVRT3kcCK8t3fVFVpVnTZSbjxSious86wI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jFm57Igq; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jFm57Igq"
Received: by smtp.kernel.org (Postfix)
	id ADCBD1F00899; Wed, 16 Sep 2026 10:09:25 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=74.125.225.79
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1789553365;
	b=3nR28XxA0ccQ4sFz9ft30CBF2ow0j/tVf/MEiJezdG7vwMD0xq6jhKTu9oDF1RAsVDLN
	 Nom3T7+dCQppEFqraY0ZvejFdVbhyquVO5kNXcORVNRNZ1ABGqaMCfAlCgM8XqEXDlVCq
	 0MZ928S4bWtViImF/EbvyfWP0c7CgDV1kvwoesvMS2aF79frDLA4+F7OMzlGoY82E/Ri2
	 LSAwqMQouy1HVgs7ipoCQipPvgzfB6HmRVkgSA6J8t63gIm0F9cjyeIST5yzjgSJaXLoo
	 stN77TmEAkAzl+41MezkDKfjxac360BD3gF+g2GnIMw1n7bIHljkDUNgPkzE6JwRo9g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1789553365;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:From:Subject:Reply-To:To:Cc:Content-Language:
	 Autocrypt:Organization:Content-Type:Content-Transfer-Encoding;
	bh=nD+B6Ap2Znzafi5abLa/1qGSU6lf02Nk2PfhG8i1pKQ=;
	b=fsStqCHxGGelQjbnhzD28DQMuAEQSPWogQnvosbB4mKYvjqaBDTfThRHei1iNQR0WtGV
	 suH+r+FKo7yXwrm2sU9K2sgCojXU7fULjllM3lY1W0AfJQZzRmEqhy1Tu5H1G5+LWz6rU
	 9bh3FK3Q8LGAX9SpxWOeQEAbAtb6uiQXujs+qV5tvnwcdgMam742lg0yHv6MbwiFCwSxk
	 kHOnulP/no3pmJeYocMEEuyvm8TczQkrJL7FbsFydM4HYwSyN9HWzkDMYcC5h+VsoJq/z
	 YbS99E+hqEh0hVMgsNPnHMZ9J4Wj2en4yX02p4tqr7XuDXtz+6NYUknTrOYdjqcmRuA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jFm57Igq;
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	arc=none smtp.remote-ip=74.125.225.79
Received: from mail-wr2-f15.google.com (mail-wr2-f15.google.com [74.125.225.79])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C36E81F00898
	for <soc@kernel.org>; Wed, 16 Sep 2026 10:09:24 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jFm57Igq
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org C36E81F00898
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr2-f15.google.com with SMTP id ffacd0b85a97d-482f633ecdeso533145f8f.2
        for <soc@kernel.org>; Wed, 16 Sep 2026 03:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789553363; x=1790158163; darn=kernel.org;
        h=content-transfer-encoding:content-type:organization:autocrypt
         :content-language:cc:to:reply-to:subject:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nD+B6Ap2Znzafi5abLa/1qGSU6lf02Nk2PfhG8i1pKQ=;
        b=jFm57IgqKv6b2oK7Jcer7I3R6p3g4rOaKYU0vuwBHhE0wgJ/zoP2r91gEKUvrzTbWO
         gTKhOUWINxbd6T6v9loq6JdZLTpvDF/FcMnD6vHRSSz0zTFmKTahS+IgSY9qxHh7Cyaf
         ZhSFeEQi8lqRDQqFyGsO0sXRFuj9gr9wImBxAv0ljcpyhF5feM8t6WWNav9fmVwmNm/8
         yoc6lu3vUb/bk/MULK3eRr9Btiz9oQAU5N6gROw++Qt/9pJd+gCOAUEFWD2TbcQnmaaS
         ex9BZhmoa40480p0tZ37LVSAcMYs1UVuHNJWr2S/551S7SuBPvKrnmXe4jINvwD1WViL
         Bp/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789553363; x=1790158163;
        h=content-transfer-encoding:content-type:organization:autocrypt
         :content-language:cc:to:reply-to:subject:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nD+B6Ap2Znzafi5abLa/1qGSU6lf02Nk2PfhG8i1pKQ=;
        b=tHBRzzc/OQgarRpvhDGPaGSBNodbDAMRWaXexddS9G9F2YId0mmYIagCAE6KD78FMS
         sAlmQWU4vZEaX6PvGj++fSfFuWrN2pAskcXLFahIa/KMiwbYnFzFfk2QZ8cU0ZHT8Xhm
         WkU1sJSC9gf6DnEW0H+h5f6bdIb+bIbCEvuxIkDxBJYbJCqCTjiDx9jFuW/jLe5xuoOY
         znEHm2s59or6K6fE7qu7d0+tyr5nIy2hRk4hDwi+IbxumX+Ha5rkhNj502GpeClZO9t/
         Oc9X8Mc8lRDgP9gW9wGyq+7mjTa3AY/48qYhaOHM20DYRYVdTW76wfrAIzg+Wr1naGhk
         lO+g==
X-Gm-Message-State: AFuF++m+xh6sZ4kg9DLuoBrlLgo6CkMqoRFNTVfDYNBa811bg9N/aj/w
	7qMwPnlbvCoh8ZwGE0Bh+fXSjOIAcpGnmK+Z/wbm+HahxBWZB7DJgBRCa+yR6/MDW6eMvtKSsr7
	OjTFu
X-Gm-Gg: AYBFou3jl0JmVIweVbEF0/ewLhu8On5H13WLNi8yLK1h7FHWofeOJgHgwsumcsnFJmK
	c9YUAQVC77UP2vCECYOd8YEUjPwERokbgxIYe/O5nED3ct/hKjM1RoJEsCbkD7g4C6241VVf3fw
	AaFTfxBimHNMuYNqQ7zIUnG3H/CKlsytaslQsiYVP5UtCaJKzQjQmAwYIJ76Kj897oNqBOT9Q5e
	E6A0W9wFJHDDzc+0fxlE36qAShIiYhxCEZwNDd88V/rdQhGzMNtYP6OvrP4LxWHTSvZRw6Dx3fb
	K2QYEVvVB6BB/jmrY4ZAPWVZxyJchqS59KpsD9crM1KJaSQhrJbp8IJfuDrA8wynrNiLuDhubC1
	tJADaqL4Cqkm42BtOF/pvWtA3WNw7sesuYMqVJ3uIEsVGz5fZaGvCGPlmzb5AZKg8i6Ylu5iJ9L
	2xv2/SzrSSeL5AnhCz2P4p/wxcF81rHtK6H6wqISbLg7XyVUsxK+mRHjS38icoP7uAENxFdkWxx
	F1n1eseGTZpU9H935mIYrlPK+7mfmoMrf/FN08jesGVaMm+qNjTKZ7tgtxWwr8BUA==
X-Received: by 2002:a05:6000:2304:b0:487:b32:9d6f with SMTP id ffacd0b85a97d-4870cf25729mr2502387f8f.22.1789553362827;
        Wed, 16 Sep 2026 03:09:22 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:449b:f2fb:7cc4:bd4e? ([2a01:e0a:106d:1080:449b:f2fb:7cc4:bd4e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf414c3sm4832517f8f.30.2026.09.16.03.09.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 03:09:22 -0700 (PDT)
Message-ID: <71b955e9-dd75-44ca-8eb8-90267dc70eee@linaro.org>
Date: Wed, 16 Sep 2026 12:09:21 +0200
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic ARM64 DT fixes for v7.3-rc
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

Here's the Amlogic ARM64 DT fixes for v7.3-rc, including a bunch of fixes
for the Amlogic T7/Khadas VIM4.

Thanks,
Neil

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-fixes-v7.3-rc

for you to fetch changes up to 406292fd75f95aa3010fec95b5beb5a8b7e3ba3a:

   arm64: dts: amlogic: t7: fix the pin groups of the vsync PWM (2026-08-31 14:42:59 +0200)

----------------------------------------------------------------
Amlogic DT Fixes for v7.3:
- Set of fixes for Amlogic T7:
  - use the real UART pclk
  - allow the SD card to be power cycled by dropping regulator-always-on
  - fix the pin groups of two PWM outputs
  - add the CPU cores PWM-driven supplies to fix runtime crashes
  - fix the pin groups of the vsync PWM using non-existing pin group

----------------------------------------------------------------
Lucas Tanure (5):
       arm64: dts: amlogic: t7: use the real UART pclk
       arm64: dts: amlogic: t7: khadas-vim4: allow the SD card to be power cycled
       arm64: dts: amlogic: t7: fix the pin groups of two PWM outputs
       arm64: dts: amlogic: t7: khadas-vim4: add the PWM-driven supplies
       arm64: dts: amlogic: t7: fix the pin groups of the vsync PWM

  .../boot/dts/amlogic/amlogic-t7-a311d2-an400.dts   |   2 +-
  .../dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts  | 113 ++++++++++++++++++++-
  arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi        |  44 ++++++--
  3 files changed, 149 insertions(+), 10 deletions(-)
