Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED003B38BD
	for <soc@lists.linux.dev>; Sun,  2 Aug 2026 14:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785679564; cv=none; b=GNo4WawtxfvSrRtEGwzFyZCykt9jeSr+zkvUTGOFGrn5QukD3CIju3bFT/zeOjJbV3FBTLYAAO7181UN3CW3Mj6NrHLz9AxcePTH4i18uHiZyUKPnx/f83YFmGKIHxNo5iUDUGa2r99G4LQDbrE/A80kt+6syTKkCl4F5pukQlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785679564; c=relaxed/simple;
	bh=NBDioksG5pOpKo0k7xIWjDfLaLsiWZzCb//BdAiMZP4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=vAbaa1jFf4EnbK4J3zqIRXZ8p0p+tW+c2SZa/5aPKfRBZJJDzVv55rBGQ9cxKOU8LL1C1mAY9gtAdicdqDJYN52SpMKGLymiiPxFfQ3vq2BkUWj/EZMqoBUfeeIDxoUO7QUt/0oPr+ttQrm5NVkc8/NSMcjxjhTQaH1fhADbZxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YKVtLapQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nw3XySt/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YKVtLapQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nw3XySt/"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 672B6l3w1352629
	for <soc@lists.linux.dev>; Sun, 2 Aug 2026 14:06:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=IUBrw7txsJyrtbO2uks4gb
	XgkSo0IF8NQtTXkzJyWQc=; b=YKVtLapQxcdEBSB6WppKRo5LugMC7Yg56KlN0m
	et8x9EJVV63bsrTS6MhujKgjwtbj40Uc+p9c7V9R4yPxaVgIGS3fDghv5xtBsU9P
	xNUY58kIJwahtmetyXBo5M8u+NJn1kTyMr5/M/z6I4xRMfYQuyY8uyX/NAuz5C1U
	en2w5P3lDYbIBbOPh7i2wpmz7s6lD+xNMWW2eKFGFiZ3/jwgDRgxQ9sHKGCZL1dS
	Hzrs/fm22rhDw+E/Ha2WzICFPko5IJYvQ7mbyYFDrdPQpbMEopoLRW0tG+wMNWCN
	bqRrw9t78SEajFGLVe+ZOw2cf1GI+U04UqylDaiO//v0o8sA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs9jftsqe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <soc@lists.linux.dev>; Sun, 02 Aug 2026 14:06:01 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e6d253330so2848323a91.1
        for <soc@lists.linux.dev>; Sun, 02 Aug 2026 07:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785679560; x=1786284360; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IUBrw7txsJyrtbO2uks4gbXgkSo0IF8NQtTXkzJyWQc=;
        b=Nw3XySt/wQdLc5D/lquT7ix/tHGtfAcmCZ+VZh2M2/2XOkaOAshWq+FltdQlgHggWe
         SxfQUP3P54/VjrMARoMsGPWs7y/FhVMSa2yIBHaFxi92WlIxwyPtTitF5b1xEAAE29Kt
         FFSXL8gjgIOnjntryd0uP22+pByo1FavbE5VmK+U4GyI7XJuo6tiO6TLmoUhHcEodUfk
         vxoHCBith2iVU3Kw782dw2n3QNVfpwUxjFHGuZD+PYjdepCouQ9yuByX/QTVCC21wgxR
         O51EJijz7fZVephbVR2v6HmS0mZhXzI7Objb0C2uoipLsZ7f0r2wAxspOn/s6FSgPa3S
         P8oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785679560; x=1786284360;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=IUBrw7txsJyrtbO2uks4gbXgkSo0IF8NQtTXkzJyWQc=;
        b=ecT0BaacGcqCvVhtAA3Ju+HBhPGq3V35fNRiLEHvSC/fY+P01aDivzXl1aheoSSbJ3
         CUJq4fGmoQ4wvqoBiKq/cC0Li7CTX69+IzcetenpGnCsGsyU9Ap2GfxbYZLGnE/UTfm8
         tNeyCVv0VxXxQbHqtmm3nUEJ1Dk3Pbsbp8Ty/6BNF2hxSGr6/w3DHz+UEcozQUU8ui5D
         vsp9qi5YwUeps8PFnoRGc3j+Niv+B6NSNMJlRibPklUvM5eN9JO+R/byRe8TkkR5wPZf
         DPfn1wEoCcse0Z5UqaSGM2Bt+IDBFnQ3q5QjKpgD1FU6shRUHT3S2Oh/MifXAR/WG3Ft
         w94A==
X-Forwarded-Encrypted: i=1; AHgh+RrLeY0Fb/Bs310WfCE2cpO2fg8OBhgYD8Bz0cL5iSGg1aJ+HlbXSeECQAJ9BWMfzDwW4fM=@lists.linux.dev
X-Gm-Message-State: AOJu0YykB6vVawaXot8+xNOni4FXE/qrIMYsnu0R4nVxPfPyzCoLIEKJ
	8M11sytJKdUZJCnPJ77NJU+lkJq+Fxxl1MKNAtOEBmKR85itCHmkh4gyvaQcRD39dTnkQ56s2hq
	rSOx6+UhTDgz3bpm8aKcHsXuji12kjq42pUvPs6j1EbWwt+qEr4I/9og=
X-Gm-Gg: AR+sD104zvSVwVFOhaGdAv1pcoHw+NNy6valnGCPEqww6EPfAw3qjIwy/H4unlB1W6Z
	LN5Zz/L7BadADgimfz0kr58sFzjK6aRhMFsnh9fUD/2+ewDUBi1cpKmNeLTlVYfbag6nrcCDevN
	RK2JrDcaQPk3bKaOYrlslx8HhiUOik7dkjvVmcWvvHKs6eaNxe2XigXwezBaCSNAyc5PkbDECtR
	/bdbH11UC30EyUAHGoLF3ln/bvSkFJrZ89ahOMtkITUbbfWHA+j3uvM8qUiswXWWnSoJ8BurUxJ
	zHU1+0MSZFuHSA2dMp2JzajXIWhG6zgw8QndK5IWehvo7jQ6xaGLiKYjxzR5iEafd6B3nCPeQsW
	5ExZ/3P2gzNpmp8UEr0ISNNMBYxyz
X-Received: by 2002:a17:90b:57ed:b0:385:3ab:fecb with SMTP id 98e67ed59e1d1-38fbc9f3ebemr4727131a91.4.1785679560488;
        Sun, 02 Aug 2026 07:06:00 -0700 (PDT)
X-Received: by 2002:a17:90b:57ed:b0:385:3ab:fecb with SMTP id 98e67ed59e1d1-38fbc9f3ebemr4727101a91.4.1785679559963;
        Sun, 02 Aug 2026 07:05:59 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab4cb51asm34484816c88.9.2026.08.02.07.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 07:05:59 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Sun, 02 Aug 2026 19:35:43 +0530
Subject: [PATCH] pinctrl: Use IRQ trigger mask helpers
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260802-b4b4-irq-trigger-mask-pinctrl-v1-1-1c398ab53d28@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALZOb2oC/yXMOw7CMAwA0KtUnrGUpgEVroIYamOC+YTWCQip6
 t0JML7lzZDFVDLsmhlMXpr1kSraVQN8HlIU1GM1eOc3rnceKVBAtQmLaYxieB/yFUdNXOyG3Xr
 LoWcKbUdQj9HkpO/fvz/8nZ90ES7fFJblAxVw+3aBAAAA
X-Change-ID: 20260802-b4b4-irq-trigger-mask-pinctrl-359c48cb413b
To: Linus Walleij <linusw@kernel.org>,
        =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Bianconi <lorenzo@kernel.org>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org,
        linux-arm-msm@vger.kernel.org, soc@lists.linux.dev,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785679551; l=6841;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=NBDioksG5pOpKo0k7xIWjDfLaLsiWZzCb//BdAiMZP4=;
 b=c21evJbK163GncmcfCcbMaR7yLK/XPxyAIAtf7iEWai9uXE/ByvKLgPIYH43r4tLlQgGRBNDB
 1flMBKgF77UCMyTh6ruqr+wSpTq0lACBWDakgwRVSnCqIKrHE0AmMJv
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-GUID: 1AUgsV--stKlO6sM38A4RcWpF1MDTKoT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAyMDEyNSBTYWx0ZWRfX6aNgPBvag/Pi
 9tspzkj3kRY0/FckgB/nzLcd1pyQKylWzg7UbDmpsWXtVUClDJ5d/W6650c1ZoN8sXD82Pa+BQd
 iEK1rAKAZrEotHZQxYv0KUQ2yhIC9jM/xu9m0cT/VjEIU7GiY8HHjKj8HOdzcvQ/wfGlOhB/WmD
 WpfBRK7MFrmq67rGMlodYfpIhHmmruhCftrRbP3wiOk6mHTTM6NAQWNWtEP+4OhvCMxs90LX/91
 P6kXBMhv/PADrBi6cshJkxBWXBF3AuVgCY8xBiNZXopo+v5q/XLZa+46KONifFiR+3cYX7Hx93d
 N3QcGEEhHNGwrMLPktWWyX0unUpBgem+nqay7oKHNhrZtkJ/FJevmmo2wWPyZGmyZBIKLnXD9Ft
 PcaBF+75GAKX+k1GUZmsHMyrFwQsGk/JDRIW+XAs4qKJtJGyr0ww4tBHA4EjDVEPVwZqWmxyuGH
 fJD//uZQH97Xqv6mz3g==
X-Authority-Analysis: v=2.4 cv=TYSmcxQh c=1 sm=1 tr=0 ts=6a6f4ec9 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=aROEccOD733urgNQ4cUA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: 1AUgsV--stKlO6sM38A4RcWpF1MDTKoT
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAyMDEyNSBTYWx0ZWRfX5uZnSRZh2C0I
 eF8JG/R5afqWL4rPt04q4Xv440/N3FI8YoeeCJeguaPtlEvkQuUV+wrU3GrrxszFFtd/X/GeKWG
 HR1btf8+BtcvVHt/VXd51sEqLWlhgJw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 clxscore=1011 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608020125

Use IRQ_TYPE_LEVEL_MASK and IRQ_TYPE_EDGE_BOTH instead of open-coded
trigger type combinations in irqchip callbacks.

No functional change intended.

Assisted-by: Claude:claude-sonnet-5
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 drivers/pinctrl/actions/pinctrl-owl.c     | 2 +-
 drivers/pinctrl/airoha/pinctrl-airoha.c   | 2 +-
 drivers/pinctrl/bcm/pinctrl-nsp-gpio.c    | 4 ++--
 drivers/pinctrl/mediatek/mtk-eint.c       | 2 +-
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 5 ++---
 drivers/pinctrl/pinctrl-ocelot.c          | 2 +-
 drivers/pinctrl/pinctrl-sx150x.c          | 2 +-
 drivers/pinctrl/qcom/pinctrl-msm.c        | 4 ++--
 drivers/pinctrl/spear/pinctrl-plgpio.c    | 2 +-
 9 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/actions/pinctrl-owl.c b/drivers/pinctrl/actions/pinctrl-owl.c
index 1f0ef4727ba7..9f5637756bd3 100644
--- a/drivers/pinctrl/actions/pinctrl-owl.c
+++ b/drivers/pinctrl/actions/pinctrl-owl.c
@@ -824,7 +824,7 @@ static int owl_gpio_irq_set_type(struct irq_data *data, unsigned int type)
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
 	struct owl_pinctrl *pctrl = gpiochip_get_data(gc);
 
-	if (type & (IRQ_TYPE_LEVEL_LOW | IRQ_TYPE_LEVEL_HIGH))
+	if (type & IRQ_TYPE_LEVEL_MASK)
 		irq_set_handler_locked(data, handle_level_irq);
 	else
 		irq_set_handler_locked(data, handle_edge_irq);
diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index abfb018f207e..90372827639d 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -2435,7 +2435,7 @@ static int airoha_irq_type(struct irq_data *data, unsigned int type)
 		if (gpiochip->irq_type[data->hwirq])
 			return 0;
 
-		type = IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING;
+		type = IRQ_TYPE_EDGE_BOTH;
 	}
 	gpiochip->irq_type[data->hwirq] = type & IRQ_TYPE_SENSE_MASK;
 
diff --git a/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c b/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
index 1fbb101386a3..83fcc80d5967 100644
--- a/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
+++ b/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
@@ -159,7 +159,7 @@ static void nsp_gpio_irq_ack(struct irq_data *d)
 	u32 trigger_type;
 
 	trigger_type = irq_get_trigger_type(d->irq);
-	if (trigger_type & (IRQ_TYPE_EDGE_FALLING | IRQ_TYPE_EDGE_RISING))
+	if (trigger_type & IRQ_TYPE_EDGE_BOTH)
 		writel(val, chip->base + NSP_GPIO_EVENT);
 }
 
@@ -177,7 +177,7 @@ static void nsp_gpio_irq_set_mask(struct irq_data *d, bool unmask)
 	u32 trigger_type;
 
 	trigger_type = irq_get_trigger_type(d->irq);
-	if (trigger_type & (IRQ_TYPE_EDGE_FALLING | IRQ_TYPE_EDGE_RISING))
+	if (trigger_type & IRQ_TYPE_EDGE_BOTH)
 		nsp_set_bit(chip, REG, NSP_GPIO_EVENT_INT_MASK, gpio, unmask);
 	else
 		nsp_set_bit(chip, REG, NSP_GPIO_INT_MASK, gpio, unmask);
diff --git a/drivers/pinctrl/mediatek/mtk-eint.c b/drivers/pinctrl/mediatek/mtk-eint.c
index 8b022545a3e9..827231dc0d24 100644
--- a/drivers/pinctrl/mediatek/mtk-eint.c
+++ b/drivers/pinctrl/mediatek/mtk-eint.c
@@ -216,7 +216,7 @@ static int mtk_eint_set_type(struct irq_data *d, unsigned int type)
 		writel(mask, reg);
 	}
 
-	if (type & (IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING)) {
+	if (type & IRQ_TYPE_EDGE_BOTH) {
 		reg = mtk_eint_get_offset(eint, d->hwirq, eint->regs->sens_clr);
 		writel(mask, reg);
 	} else {
diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
index 0df749cbcba8..e051ff141d6c 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
@@ -259,11 +259,10 @@ static int npcmgpio_set_irq_type(struct irq_data *d, unsigned int type)
 		return -EINVAL;
 	}
 
-	if (type & (IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_LEVEL_LOW)) {
+	if (type & IRQ_TYPE_LEVEL_MASK) {
 		npcm_gpio_clr(&bank->chip, bank->base + NPCM7XX_GP_N_EVTYP, gpio);
 		irq_set_handler_locked(d, handle_level_irq);
-	} else if (type & (IRQ_TYPE_EDGE_BOTH | IRQ_TYPE_EDGE_RISING
-			   | IRQ_TYPE_EDGE_FALLING)) {
+	} else if (type & IRQ_TYPE_EDGE_BOTH) {
 		npcm_gpio_set(&bank->chip, bank->base + NPCM7XX_GP_N_EVTYP, gpio);
 		irq_set_handler_locked(d, handle_edge_irq);
 	}
diff --git a/drivers/pinctrl/pinctrl-ocelot.c b/drivers/pinctrl/pinctrl-ocelot.c
index 0fe0527863b8..58d3cde9f964 100644
--- a/drivers/pinctrl/pinctrl-ocelot.c
+++ b/drivers/pinctrl/pinctrl-ocelot.c
@@ -2317,7 +2317,7 @@ static const struct irq_chip ocelot_irqchip = {
 
 static int ocelot_irq_set_type(struct irq_data *data, unsigned int type)
 {
-	if (type & (IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_LEVEL_LOW))
+	if (type & IRQ_TYPE_LEVEL_MASK)
 		irq_set_chip_handler_name_locked(data, &ocelot_level_irqchip,
 						 handle_level_irq, NULL);
 	if (type & IRQ_TYPE_EDGE_BOTH)
diff --git a/drivers/pinctrl/pinctrl-sx150x.c b/drivers/pinctrl/pinctrl-sx150x.c
index 89fdfa96843f..2dd1f220bff1 100644
--- a/drivers/pinctrl/pinctrl-sx150x.c
+++ b/drivers/pinctrl/pinctrl-sx150x.c
@@ -525,7 +525,7 @@ static int sx150x_irq_set_type(struct irq_data *d, unsigned int flow_type)
 	struct sx150x_pinctrl *pctl = gpiochip_get_data(gc);
 	unsigned int n, val = 0;
 
-	if (flow_type & (IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_LEVEL_LOW))
+	if (flow_type & IRQ_TYPE_LEVEL_MASK)
 		return -EINVAL;
 
 	n = irqd_to_hwirq(d);
diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 641113831a7b..27f06bbc113c 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -1191,9 +1191,9 @@ static int msm_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 
 	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
 
-	if (type & (IRQ_TYPE_LEVEL_LOW | IRQ_TYPE_LEVEL_HIGH))
+	if (type & IRQ_TYPE_LEVEL_MASK)
 		irq_set_handler_locked(d, handle_level_irq);
-	else if (type & (IRQ_TYPE_EDGE_FALLING | IRQ_TYPE_EDGE_RISING))
+	else if (type & IRQ_TYPE_EDGE_BOTH)
 		irq_set_handler_locked(d, handle_edge_irq);
 
 	return 0;
diff --git a/drivers/pinctrl/spear/pinctrl-plgpio.c b/drivers/pinctrl/spear/pinctrl-plgpio.c
index 1ec22010a3f9..5fcbea32089d 100644
--- a/drivers/pinctrl/spear/pinctrl-plgpio.c
+++ b/drivers/pinctrl/spear/pinctrl-plgpio.c
@@ -339,7 +339,7 @@ static int plgpio_irq_set_type(struct irq_data *d, unsigned trigger)
 	if (plgpio->regs.eit == -1)
 		supported_type = IRQ_TYPE_LEVEL_HIGH;
 	else
-		supported_type = IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING;
+		supported_type = IRQ_TYPE_EDGE_BOTH;
 
 	if (!(trigger & supported_type))
 		return -EINVAL;

---
base-commit: 415606a7be939835db9b0d6b711887586646346d
change-id: 20260802-b4b4-irq-trigger-mask-pinctrl-359c48cb413b

Best regards,
--  
Maulik Shah <maulik.shah@oss.qualcomm.com>

