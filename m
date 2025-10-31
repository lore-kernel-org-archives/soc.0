Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDAA13431F0
	for <soc@lists.linux.dev>; Fri, 31 Oct 2025 13:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761918655; cv=none; b=e2eje5eNtnlojn3RGEvCNMM1atADFItmQXFcQHUD5Ak2rxaQNdx/RcwIdibGmtP2VnFDRzZxT0mxGp353GYCgnGcjmS2hhUHdodDlioKyEPjY/i8jnaLhoJGrSoBubKcTM6XZrgNc2rZTknmi5pv8rVf+TzpSN6QGdUBES1Oqyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761918655; c=relaxed/simple;
	bh=SmfR1ZQDKDR/gPIplrtS+9dHdS1dhkdiyMyQwkEDbCI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=p72CPlKb+hpQ/wVmWVnKWxz8FQb+2fXCaXpskK+tcTIw2J7KhsApwXxagTM99WHsF92p3Or5/0xw1e1yjNNy8cYrLZtFCJoLgjxJqTb6pzJa45Rn/JhJEjQBmNHtP9E/aT3/XGxrhpod6IKvv1LfqOwcxWQf/miQa3k/82mC7is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v/+n+UnY; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v/+n+UnY"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-63c21bbdcceso424204a12.1
        for <soc@lists.linux.dev>; Fri, 31 Oct 2025 06:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761918652; x=1762523452; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MqCRP9/Mbai8FOF4N9IAH1BiG9vM0x9aR5MB26eKXF8=;
        b=v/+n+UnYhH7nBZYMtOVjVxzSCgDyuqaEo+HbF42VzutmZbYxMtv0mNRCvER/KynL6n
         yfS7tbsOEdiyYc/4EDZNGzzbJvBdi7DaDBbeiXODLa6fiH9CwV/H0GY713KO2tAJYpf8
         hOogiOmfcCCuRvR6x1C1VohxZ8YIPP2G10kNjpcWUYo4cpHMStrFSZIUIZWMuIehys3M
         xLZQaTnxtinpXDyRcvxnAJCEjjtTZ0y61aOixNpWsTLfMRdShOwUg0FYP4jawnXoSDk3
         +FutFyX2Ciyq4YNG5u7fqbVctuKFRpH1obnU+NfS7GyfXIvLiz/jwHb+DcaAFHOdnrSn
         rG3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761918652; x=1762523452;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MqCRP9/Mbai8FOF4N9IAH1BiG9vM0x9aR5MB26eKXF8=;
        b=HLiF9WJZisOxQwwDNdnH5TAMWRPYIZJxNA/2TtgijdEko/JNLu5pIVXKiKwaaO16mZ
         vCc39Rc2iyDCi8kKN54tZPZhQ8cacuFhX6axMgd3NX7zvqR+yfq403mz/5rnwk0ostL8
         htTbI+an3WkZZLIzQ1v8hgYanswGrOMgyipMhJKSCcQtgqneVj3aJQ14NPTdvtAFY/QO
         RcBK4FW4UiBJHHB4JoNkn6DhadrfQbyORp+SeAhC3ei4dW0RmsAezXVbm9ATsXc+uV6u
         xkExLovEPip0eX+Fbq/+xph5FJxwQWApdZ4/kKmh9q82DtKUOmsibmH4GQFDG4xavdLD
         tAJA==
X-Forwarded-Encrypted: i=1; AJvYcCW2xOa3UbzS3MXIca/hz98vsjFS5wihYHMac74/bN1SwpnHYvE+c2mmlwtH4P649tUZtEU=@lists.linux.dev
X-Gm-Message-State: AOJu0YyPHzisteu/CVu0Ki1LyWZmsQoywqwg+Bv1HZxjHdaR/91Tmr70
	WVkN3+lcSfYHvCb/ULmM5+66eENB6zgVfUBW+jMHQMlJbd3npQTx42ETnQKByvlS07s=
X-Gm-Gg: ASbGnctZaJBK1Tu22vwRcefKNOC/pm9d+FEHPOd64QCrJiZwTcLMRiKJ+iUyFlbwB2i
	GS+zgMAcJ7gAMcE7DNnv3h/YEM2wPrGc1jxjR48/17NkbDHTaRwTfn32bsKXUdXV4kKlubsnM/b
	MA/YtxlpcHxk545xmtN06j1kUG8yQsiajkYr12LnX6kUnZ/PfjXoP+dkbbstjtKGZUOa5Hl73PS
	vxOPaLGP0nlWed0LCr+oUy1TrSTfFiGFKSx5ut0Ztdt0ifZcAEaJygf9oukFJrx8ozMDwgzxCGv
	rzcnE+6ufQ9q0VqngvjAVROw+3vMsLURftUKlGPlzv6/zBmRWSseH3zkxmoEhpYi1g5ZKsaF3y1
	CaKBUBXeCVOFUOx0Vw1ZhK7VEdoZ214QkTTT94zQbu/pr0aRzVFwfVSUjCGWnxPqslNQ7KeyT5T
	Rt08C5xDbc59A=
X-Google-Smtp-Source: AGHT+IG4ALcuZ2ZkrRAVrLeUPvJuTLghF2aRSPyjEkOrlsMOO2oZQiqthEsk9HuFzyEGo/NHGSB7Vw==
X-Received: by 2002:a05:6402:2812:b0:637:e5dd:ef81 with SMTP id 4fb4d7f45d1cf-640770412e2mr1525778a12.8.1761918652041;
        Fri, 31 Oct 2025 06:50:52 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6407b438ca4sm1647724a12.29.2025.10.31.06.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 06:50:51 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH fixes] MAINTAINERS: Update Krzysztof Kozlowski's email
Date: Fri, 31 Oct 2025 14:50:39 +0100
Message-ID: <20251031135041.78789-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1959; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=SmfR1ZQDKDR/gPIplrtS+9dHdS1dhkdiyMyQwkEDbCI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpBL6xj/1/uZGgWmRCMjhesc0s7ijjyTpdGyik9
 o3dmzeDDMCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaQS+sQAKCRDBN2bmhouD
 10xWD/0VNvesF6NpXo8GEMwtCDZGsmu1Ez1bxfGh4Wcx8onnFQYnJNNM0nZS4Wra8wGmIXEs2yw
 ++O7yRYY32m3kWy7wl1tJONc8eJPqu77N1N1J0jeXL4Cz8FHBNH31WAsiSIVY+apYXuoOxs42dP
 kOzCCOelWYKPetbG0HTVRPbUFz4woOj0T4iP7DHfedmRhvm/8hyEnMNlOLa03C5ui0vSu+b/tBw
 Z9qHcDlE+VzHsmLdEPH9Xlin29uUzxZHrbUfEZMJU/TKfF+Zkwch+U1LP9hm+6ba0ac9RWRD9NA
 aqa7RJMb9S4Z3gDXjntdUxKqOwhj/GJaRlfbtR3tkBo5fCwDA3/qDEg49bIefrWNoIddZAC8VLI
 +Gs8ExA/Wfsg/INK6QdWmSK+MHsaVW4o7MMnt5112zF691VElnAGnu1ALJryqz3IDqvy9juiYXr
 kRrKPAt9w6gQ8PTEj5yr2hV1SRIc5PFxNbO+txUTBigl0D4Q0TVxNCJYOh5kSMQCB6/Ly7fF4Qh
 tDKuudpRKh4mic+mjJ/9K+j8+PlO1KszRubCHAMKbfOZ1T0iLvjK42x66Zw2Og3puPRWwAN9x52
 JoK8EpG7tYRyyWk9lpcG8I44Puhr/v/k/8cmmzeuc1m17fRq8s6uOXfcdah9P+nX3W9/b1dsbhv iBSYSdgq8bvnv0A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Update Krzysztof Kozlowski's email address in mailmap to stay reachable.

Link: https://patch.msgid.link/20251021095426.86549-2-krzysztof.kozlowski@linaro.org
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Patch for current cycle please.

 .mailmap    | 1 +
 MAINTAINERS | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/.mailmap b/.mailmap
index d2edd256b19d..9811c2a979cf 100644
--- a/.mailmap
+++ b/.mailmap
@@ -435,6 +435,7 @@ Krishna Manikandan <quic_mkrishn@quicinc.com> <mkrishn@codeaurora.org>
 Krzysztof Kozlowski <krzk@kernel.org> <k.kozlowski.k@gmail.com>
 Krzysztof Kozlowski <krzk@kernel.org> <k.kozlowski@samsung.com>
 Krzysztof Kozlowski <krzk@kernel.org> <krzysztof.kozlowski@canonical.com>
+Krzysztof Kozlowski <krzk@kernel.org> <krzysztof.kozlowski@linaro.org>
 Krzysztof Wilczyński <kwilczynski@kernel.org> <krzysztof.wilczynski@linux.com>
 Krzysztof Wilczyński <kwilczynski@kernel.org> <kw@linux.com>
 Kshitiz Godara <quic_kgodara@quicinc.com> <kgodara@codeaurora.org>
diff --git a/MAINTAINERS b/MAINTAINERS
index 46126ce2f968..811a89d61b87 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16186,7 +16186,7 @@ MEMORY CONTROLLER DRIVERS
 M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
-B:	mailto:krzysztof.kozlowski@linaro.org
+B:	mailto:krzk@kernel.org
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git
 F:	Documentation/devicetree/bindings/memory-controllers/
 F:	drivers/memory/
@@ -21148,7 +21148,7 @@ F:	Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
 F:	drivers/i2c/busses/i2c-qcom-cci.c
 
 QUALCOMM INTERCONNECT BWMON DRIVER
-M:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
+M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
-- 
2.48.1

