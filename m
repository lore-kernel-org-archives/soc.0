Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E91223E325
	for <soc@lists.linux.dev>; Thu,  8 May 2025 09:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746695279; cv=none; b=RZ5l5SJ/2Vv5P0+UlTwPq/HKWlEtXrmQ0Tr/hj8YUfMlB8zYHHpnuf0+CO5IuAkO3V3nJO5+sim5haNlvKj+dNGq5PBG7qSCRqa9xWduOBOrt89XrNtnyia3rajqYwKrkH/gnC/ylZhX/qwfiv6FoYWrw/Sv3aZSMj8E/B75+44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746695279; c=relaxed/simple;
	bh=cFOGWnVtQr0saOTihmVXuGVu+LURGA/kQzStCBpjTyg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BZ51XsYMWkYJnyZkf3XWDAs+x1pVujNePxKVGLLrz7xExxyG9SRmXQzE1CPEYkyg9WMEccfLJIi+pwb+wtOtpYKYeLcsJH6MDXSWDfW7a7jAB3ZIKdIb8dpxTkutRMuKl4Cqp7aRj51zPJuLkB+r9z4d2FrKTgEwsnajVIzDRD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JPOYH1wu; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JPOYH1wu"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a0b4c828c1so95415f8f.2
        for <soc@lists.linux.dev>; Thu, 08 May 2025 02:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746695275; x=1747300075; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lMpv5HRf7q1KKLcNwoafQJQk9nLYrnMRUfqpfBYSi/E=;
        b=JPOYH1wujAJA1TBnMGI7A20cp1SFxOFaQvvglFzrUFsPyi6De+2DI8KsMp2y3VcgcX
         mE93QxPrvGRfBeZbezW1NLz11Qa6UjZmtJbooMoDdWbraJr8y9sBNCo1zSPYTbcAw3FM
         Q65ucEX7JVi6Irx0Uhl4rxuB5pAJjAQc4fGUsDGXoE5fanxbiA5hAP7++oKDH+ZFrXPA
         +aE+Rz8CiG3/7tXpA21gb9ijvzHfrr20YArz9iqMGx8IkWH1rYvnUSDgVzy0WH8TQcad
         xc5y5+MYbdAZQxmjrXcKAQ6I7uEg1ua8z3/UrrO97/eqJKNfqcA6TbIeGNjaA5TCwbPj
         nWwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746695275; x=1747300075;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lMpv5HRf7q1KKLcNwoafQJQk9nLYrnMRUfqpfBYSi/E=;
        b=Pr5qIrwpKSs4fiNbmLx1YQgVhrexdD3/COs5crYVVvQbcpHn3Lo/KT6GdE2wk0ErT/
         S9rh9tgSOAj3/JQhBW3Ol6Z2VrnbbSu8Qo6U8nIboECwPnHT1p9XzauL5q2yFCjMknA9
         EN/iGKhIPvOMsP2qCUk9yJjnzIQHy+oV/R8mSH5O2dHw9gUTaOFzWYUBdEoPDHc5zPOI
         8EsWanu5iPNxvsYAGAd/lsa4iDoCAaDFDfHT7dhWKMqBOzqoqPaLyQlSzeFsOFhbJfJK
         3myXcG6fLH1fd7VnWPDFn5aMVOdgRLq+ETl/dA7zmvUyAm03zjb4r9u+xjHC978NAcw1
         irRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUymfAnZz3vvvU0ir2wkiH5n+66xFJo61ytDwTPGYS1HZ7Ak+acV3hmYLKVnKJP/DTMF4g=@lists.linux.dev
X-Gm-Message-State: AOJu0YxZfGOqKazef4p6uW9EVZIQyVA8nhUANnNQ1DNQqo9PRZMi965a
	jrjnzATncnvxS62xmcG1OEgyOGUiYGckcd1KO9XBFEW5WVYNrcdPbOA/iM8/VowaVYjsDSowN2j
	9
X-Gm-Gg: ASbGncsiLwO7aucIGzapk/KA3ZFa6NTIcqA+yD6bQ0zRuoNd8WMbUwuJgnDzeHUC+GC
	36vFSn5gRCX0t1wlJAz84rb2p6wOrbErfKsMVZnX3++eUz2+uGA5TKcFiDK25xR0CA/VfuMJb8B
	tKls3T7R9WuTcWGrCT1Cqzm08OICQ5ZTZUf4H3fOc47icKFfDMdq+Qkr0OWf6MlO1xReYXXYxfx
	jq9yYg/1kUCNfJ4L5ZCEwRPPbwkiT66GfuHpyDWvkSMJ5JxAmoLhEciF1sExBv+Otkezp1rL4Ox
	WrjWW0GiiB/KiXh3AOyCVC52/q6frzlHZPTJODoJNEi38gFBzQ==
X-Google-Smtp-Source: AGHT+IEPpTmtaFEr5272RyfI2A5wJm126PcKcCmO3UU4wfCfxMuNh81Fph52JbVRVXplQwXettz9FA==
X-Received: by 2002:a5d:588b:0:b0:3a0:782e:9185 with SMTP id ffacd0b85a97d-3a0b49e9e45mr2153806f8f.2.1746695275227;
        Thu, 08 May 2025 02:07:55 -0700 (PDT)
Received: from kuoka.. ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a0b5764733sm4867922f8f.22.2025.05.08.02.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 02:07:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Mark Brown <broonie@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] memory: drivers: renesas for v6.16 (for SPI and arm-soc)
Date: Thu,  8 May 2025 11:07:48 +0200
Message-ID: <20250508090749.51379-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2476; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=cFOGWnVtQr0saOTihmVXuGVu+LURGA/kQzStCBpjTyg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoHHRlWbsbAFQq97t0KAdqrSkwvWfZRQTyzwNrF
 lAI8TxsExmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBx0ZQAKCRDBN2bmhouD
 179UD/49zZ3UpgAr2vDLFWDBNBHfYlp58/q6tWf1hqTuUKsHwB0kWAprD/ZAXKdf/4M3IlwYI0q
 pT/ByCDAt9N9kRg8s3cfs3eR0+VjN+HFE21+ml6ss00duM9Ujrmzn/CyiV9zdItjpGURh2R9asK
 d20mVaMAJ5TsM2iq3Hnmy2jf+O/bEbneaimBc1JFLgdkPXbqflAXUwlChC8iHhHldAJLfugOnW2
 rFn2dNNobiSigTBAZ6t4BFBl9LOcIhp67BvIDblrw6Bkt9JGgmfL68ctwKbQJ8Li7RgsZDgU8RZ
 bJUHj+mkRN5Hj/WeuW2FzL3LEGU6dzTT8QMR9OLCq9ocBg0aqlVCJU2BOXh5j+4nzM3QozUUeii
 RXE2oHJlA3ASHsbmJIGnFLpeXCbhYNo+y+0qMnDf5Kn2WaXgUwvn/q+DRPFrAwgAb+1jf+WYhnE
 MGimB9e1zYuslH2by/Av8cXinVy5bII5uV/iFKrHy+ze35QD6fY6dumxeR+cGgOR6/4e50VmTTU
 Oz1BjcGS/6vKbPJc6dWGo5cGIhihf3YL1zJMSeqxvA84bxJqML5UGyC9KX8R6lY+94d2t10Ark9
 zpwOhTuu4hK4Agmvhb1qsatvDx7hfZKdXvtBo4PLcbrJkRmHhR8h8hkSs3k2nHzhuNlLz0YgCl3 xemMhmYlhcYiRpw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Hi Mark,

Feel free to pull stable tag with Renesas PRC IF memory controller driver
changes exposing interface for the SPI driver:

https://lore.kernel.org/all/20250424090000.136804-8-biju.das.jz@bp.renesas.com/


Hi Arnd,

Please pull this into soc/drivers for v6.16.

Best regards,
Krzysztof


The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-renesas-6.16

for you to fetch changes up to 798dc3f19c9e3855c18c3afb610bc5d27195ef44:

  memory: renesas-rpc-if: Add missing static keyword (2025-05-08 10:59:07 +0200)

----------------------------------------------------------------
Renesas memory controller drivers for v6.16

Improvements and new device support for the Renesas RPC IF memory
controller driver:
1. Minor cleanup and improvements.
2. Refactor the driver to accommodate for newly added Renesas RZ/G3E support:
   - Acquire two resets instead of only one,
   - Add RZ/G3E xSPI support with different register layout and its own,
     new interface for Renesas SPI.

----------------------------------------------------------------
Biju Das (9):
      memory: renesas-rpc-if: Fix RPCIF_DRENR_CDB macro error
      memory: renesas-rpc-if: Move rpcif_info definitions near to the user
      dt-bindings: memory: Document RZ/G3E support
      memory: renesas-rpc-if: Move rpc-if reg definitions
      memory: renesas-rpc-if: Use devm_reset_control_array_get_exclusive()
      memory: renesas-rpc-if: Add regmap to struct rpcif_info
      memory: renesas-rpc-if: Add wrapper functions
      memory: renesas-rpc-if: Add RZ/G3E xSPI support
      memory: renesas-rpc-if: Add missing static keyword

 .../memory-controllers/renesas,rzg3e-xspi.yaml     | 135 ++++
 drivers/memory/renesas-rpc-if-regs.h               | 147 +++++
 drivers/memory/renesas-rpc-if.c                    | 714 +++++++++++++++------
 drivers/memory/renesas-xspi-if-regs.h              | 105 +++
 include/memory/renesas-rpc-if.h                    |   4 +
 5 files changed, 914 insertions(+), 191 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/renesas,rzg3e-xspi.yaml
 create mode 100644 drivers/memory/renesas-rpc-if-regs.h
 create mode 100644 drivers/memory/renesas-xspi-if-regs.h
