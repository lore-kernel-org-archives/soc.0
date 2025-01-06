Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6711DE3C3
	for <soc@lists.linux.dev>; Mon,  6 Jan 2025 14:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736173511; cv=none; b=D40kG+kHMzXIkoxTkPJZkfP5uJCyUGbHz8rqarM8c1y2NO+TKdU96upGD3MU8SgViBnWWsK304Y/IjtreMq5mzoKrnO2R+mIruIuhKEAUjsWM7YixvOwDmKWno9u2D5yXsVkO1hvJXn9BN/VIL8uQOMs64IiR6ZGEso3HDfeCuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736173511; c=relaxed/simple;
	bh=7J8MR3Rw76nWad7FZEfnxXrrY3M52LGLpYdfdKBjwsk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=DNIYJ6zivLcZenAjZNXmscr0pdX9DrBtDEYO5UafuPOnb3RZHaBDFOtOMNcMlRSQOY7ze7e8kZsoUzVs0Z3krzWHjN5a7HMNnDx/4apqYDLd5B+zx9QGZAhM0OND+8Wd/H0nWE/JdMbW+ZqHP8sZ+xg8PZYFUHWOgjsCsOCoDko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z326ND2g; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z326ND2g"
Received: by smtp.kernel.org (Postfix)
	id B683DC4CEE5; Mon,  6 Jan 2025 14:25:10 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A545FC4CEE1
	for <soc@kernel.org>; Mon,  6 Jan 2025 14:25:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A545FC4CEE1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4361dc6322fso95931315e9.3
        for <soc@kernel.org>; Mon, 06 Jan 2025 06:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736173508; x=1736778308; darn=kernel.org;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7TIciRlELDCLEEoclqE+Kfoj3mhZ/N1C2qRWtIuv9OY=;
        b=z326ND2g0CI7urG0d5eYgKsWkECe0qPsS6JZYDcC765yEqKkV33ICqTDOkXXi3PHSA
         yH7yxSI5Q9asrQMijxWprrzlawoGQLep+wRknZ42rnLyrPQMfbGj58ES+74l+PjIqy2c
         2u1d4AKgfUHpIr4k6D/Als3hu/oIUpMYCd9tIqRexZcyHsi0HwQDFDRZiSSPzcVxnqJ1
         neKqEMZ79FkRYor6ZEeUujrgJCq4NAbMDej5lKL6V8ZzpneUythUQCV06o5w9u3KeUBE
         GyHL+4LetHqSGq6BSQ3FgMBqvE5FIR+0mEz+WlaRSiwFx/Zk+QIf5m0bEavezlrpVIzL
         PHrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736173508; x=1736778308;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7TIciRlELDCLEEoclqE+Kfoj3mhZ/N1C2qRWtIuv9OY=;
        b=JiEW7HjxV3NsHcn03uJ1K3ZRFkMVWdLHL+vKcoeLNOQTkpPyMWbsswDDrdohXxYPLw
         9Qnch2EGxoHx3lpK0yPpYTIhBJIVrDG+exnMFLzJ7QF/NXE8aciG5TzsMFRnqy3Ez4Dn
         4sFYYSe1PbmCZxlGn90KWiuteQ/pJHxaOW7OrYT5rF40bkfQhCJN+Zt27V/6rH3fj2rU
         UPVoSb9eExbFoA56e/Kz1jUTcTT0SX+g7qBw5Gw+DnCg9R76m+AFID1Sg9AQJYmBxONF
         4jchncAShsx51n9ftIHSN5Zfh7d3vjlPhoSa/Aqb5Ji2e/6XoBNeePKpZHrvDrsMypbA
         39rw==
X-Gm-Message-State: AOJu0Yz5+90hLpUfz5FDYxjik8bi7kvvH6kJVSoJV3MProzU9wHSK+u2
	/BAt9mewt++4K7C3HscsNe2zYNvyN4dbQFLMThjqSdlgrVSg/HuPBY2JfvFBbsZ74TMHIbV5h0y
	G
X-Gm-Gg: ASbGncvBEqlOgWBZUYK7yYkqyHVzuEaUmFpOvG2R4s8GmQExrfGRKYqAaQ8K4OkNSFv
	nqJUzWLB83rhqU/A7xDtCyb5seqDQp2s0beLWTcahoPc/TfynSNuI+rYa09YvuCbfB1XqaAC6I8
	kKY5PS97luPe1wVYReGiNcq1KC1/jiMuhJosNp4xzM9NcqjeqVfb2jFLC49eMPEDG4YmyREAtHW
	6zosEMY2mYrvuHnsCUN0BKFwocl5/9TH7VHps2oUHVGTVdtaISyZ7Ed3gRYTAuIXn4cXztPlAVr
	OPIQ8Ec8y+vl0oyPmoR3gZ8dvFI7
X-Google-Smtp-Source: AGHT+IFDv6yPrrMdiLufyHJiRsCS+tNLTAQN7y7Zs6wjnXNJFvDTqtBqNWJ/t9oqV6eZf1xaBL1XqA==
X-Received: by 2002:a05:600c:1912:b0:434:a968:89a3 with SMTP id 5b1f17b1804b1-436686436f9mr515572745e9.9.1736173508239;
        Mon, 06 Jan 2025 06:25:08 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:95:e905:1421:811c? ([2a01:e0a:982:cbb0:95:e905:1421:811c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4366127c639sm564181945e9.31.2025.01.06.06.25.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 06:25:07 -0800 (PST)
Message-ID: <d22513cc-c326-443c-982b-78adf755d3dc@linaro.org>
Date: Mon, 6 Jan 2025 15:25:07 +0100
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] Amlogic drivers updates for v6.14
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

Here's the final DT bindings change that will give 100% success in Amlogic
ARM64 & ARM64 DT Bindings checks, with the mmc-slot bindings change routed
via the MMC tree.

Thanks,
Neil

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

   Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-drivers-for-v6.14

for you to fetch changes up to 960a4140ade8f6ba44e78dc40b80bbf272027805:

   dt-bindings: soc: amlogic,meson-gx-hhi-sysctrl: Document the System Control registers found on early Meson SoC (2024-12-11 09:49:49 +0100)

----------------------------------------------------------------
Amlogic drivers changes for v6.14:
- Document the System Control registers found on early Meson SoC

----------------------------------------------------------------
Neil Armstrong (1):
       dt-bindings: soc: amlogic,meson-gx-hhi-sysctrl: Document the System Control registers found on early Meson SoC

  .../bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml | 14 ++++++++++++++
  1 file changed, 14 insertions(+)

